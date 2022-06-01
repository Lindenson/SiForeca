package com.wolper.service.impl;


import com.wolper.dto.AppUser;
import com.wolper.dto.AppUserRole;
import com.wolper.dto.ResetToken;
import com.wolper.dto.UserBlocked;
import com.wolper.exceptions.EMailException;
import com.wolper.exceptions.UserAuthException;
import com.wolper.repositories.AuthRepository;
import com.wolper.repositories.TokenRepository;
import com.wolper.repositories.UserBlockList;
import com.wolper.repositories.UserRepository;
import com.wolper.security.JwtTokenProvider;
import com.wolper.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;


@Log4j2
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    @Value("${security.newuser.enabled}")
    private int enableByDefault;

    @Value("#{${security.password.token.expire-minutes}}")
    public int passExpiration;
    private final UserRepository userRepository;
    private final AuthRepository authRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenProvider jwtTokenProvider;
    private final AuthenticationManager authenticationManager;
    private  final TokenRepository tokenRepository;
    private final UserBlockList userBlockList;


    /**
     * Authenticates user and if success returns a JWT token
     * A token will include IP address for extra security
     * Throws UserAuthException if either name or password is incorrect
     * @param username
     * @param password
     * @param ip 
     * @return generated token for successfully authenticated user
     */
    @Override
    public String signin(String username, String password, String ip) {
        try {
            Authentication au = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
            userBlockList.deleteById(username);
            log.info("SIGNIN WORKED");
            return jwtTokenProvider.createToken(au.getPrincipal(), ip);
        } catch (AuthenticationException e) {
            throw new UserAuthException("Invalid username/password supplied", HttpStatus.UNPROCESSABLE_ENTITY);
        }
    }

    /**
     * For a new user put his name and a password (encoded) into a DB table as a temporary 
     * record waiting for e-mail confirmation. This record also includes an expiring token.
     * On success, it returns a generated token. This token is to be put in a letter 
     * sent to a new user (for e-mail confirmation). The token will be a part of 
     * a confirmation URL link (precisely a URL parameter).
     * Transactional and uses a default (repeated read for Postgres) isolation level.
     * If DB exception is thrown (unchecked for Spring Data) it will be a controller's business
     * @param username should be a correct e-mail address.
     * @param password 
     * @return token string
     */
    @Override
    @Transactional
    public String signup(String username, String password) {
        if (userRepository.existsByUsername(username))
            throw new UserAuthException("Username is already in use", HttpStatus.UNPROCESSABLE_ENTITY);
        String code = UUID.randomUUID().toString();
        ResetToken resetToken = getTocken(username, code, passwordEncoder.encode(password));
        tokenRepository.deleteByUsername(username);
        tokenRepository.save(resetToken);
        return code;
    }

    /**
     * Atomically deletes a user from DB tables "users" and "authorities"
     * Transactional and uses a default (repeated read for Postgres) isolation level
     * If DB exception is thrown (unchecked for Spring Data) it will be a controller's business
     * @param username
     */
    @Override
    @Transactional
    public void delete(String username) {
        authRepository.deleteByUsername(username);
        userRepository.deleteByUsername(username);
    }


    /**
     * Find a user by a name in a DB
     * @param name
     * @return AppUser object
     */
    @Override
    public AppUser whoami(String name) {
        return userRepository.findDistinctByUsername(name);
    }

    /**
     * Gives a list of all users found in DB table "users".
     * If DB exception is thrown (unchecked for Spring Data) it will be a controller's business
     * @return AppUser instance
     */
    @Override
    public Iterable<AppUser> userList() {
        return userRepository.findAll();
    }


    /**
     * Enables all users from the list to login.
     * Transactional and uses a default (repeated read for Postgres) isolation level
     * If DB exception is thrown (unchecked for Spring Data) it will be a controller's business
     * @param usList
     */
    @Override
    @Transactional
    public void enableUserList(List<String> usList) {
        for (String user : usList) {
            userRepository.setUserEnanbedByName(user);
        }
    }

    /**
     * Generates and store a token for e-mail confirmation or password changing.
     * Transactional and uses a default (repeated read for Postgres) isolation level
     * If DB exception is thrown (unchecked for Spring Data) it will be a controller's business
     * @param user
     * @return a token string
     */
    @Override
    @Transactional
    public String createEmailToken(String user) {
        if (findUserByEmail(user)==null) throw new EMailException("User not found");
        String code = UUID.randomUUID().toString();
        tokenRepository.deleteByUsername(user);
        tokenRepository.save(getTocken(user, code, null));
        return code;
    }

    /** Finds a user in a "users" DB table by its e-mail.
     * As mentioned above user's login (name) should be a valid e-mail.
     * The registration requirement is to put in e-meil (as a name)
     * and a password during signing up process.
     * @param userEmail
     * @return
     */
    @Override
    public AppUser findUserByEmail(String userEmail) {
        return userRepository.findDistinctByUsername(userEmail);

    }

    /**
     * Is used for: changing a password (1) or registering a new confirmed by e-mail user (2).
     * If password is not null than a password replacing logic works.
     * If null, it means that a new user was temporarily saved in a special DB table.
     * In the first case user is to be updated.
     * In the second case a temporary record is to be deleted and user is ti be placed into
     * "users" and "authorities" DB tables. In both cases it is supposed that a token was
     * sent to user by e-mail. Thus, token is to be checked on validity and not expiration first.
     *
     * Transactional and uses a default (repeated read for Postgres) isolation level
     * If DB exception is thrown (unchecked for Spring Data) it will be a controller's business
     *
     * @param token
     * @param password
     */
    @Override
    @Transactional
    public void setNewPasswordByToken(String token, String password) {
        ResetToken foundToken = tokenRepository.findByToken(token);
        if (foundToken==null || expiredTocken(foundToken))
                                  throw new EMailException("Token Expired or wrong!");
        AppUser user;
        //change pass case
        if (password!=null) {
            user = userRepository.findDistinctByUsername(foundToken.getUsername());
            user.setPassword(passwordEncoder.encode(password));
            userRepository.save(user);
            userBlockList.save(new UserBlocked(user.getUsername()));
        }
        //new user case
        else {
            user = fromTemporaryUser(foundToken);
            AppUserRole userRole = new AppUserRole(0, foundToken.getUsername(), "ROLE_USER");
            userRepository.save(user);
            authRepository.save(userRole);
        }
        tokenRepository.deleteByUsername(user.getUsername());
    }

    @Override
    public void signOut(String user){
        log.info("SIGNIN WORKED");
        UserBlocked ub = new UserBlocked(user);
        userBlockList.save(ub);
        log.info("SIGN OUT SUCCESS!");
    }



    private AppUser fromTemporaryUser(ResetToken token){
        return new AppUser(0,token.getUsername(), token.getPassword(), enableByDefault);
    }

    private ResetToken getTocken(String user, String token, String password) {
        LocalDateTime localDate = LocalDateTime.now().plusMinutes(passExpiration);
        return new ResetToken(0L, token, user, localDate, password);
    }

    private boolean expiredTocken(ResetToken token) {
        LocalDateTime localDate = LocalDateTime.now();
        return token.getExpiredate().isBefore(localDate);
    }
}
