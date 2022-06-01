package com.wolper.security;

import java.nio.charset.StandardCharsets;
import java.util.*;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import com.wolper.controllers.JWTUserController;
import com.wolper.exceptions.UserAuthException;
import com.wolper.repositories.UserBlockList;
import com.wolper.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import java.security.Key;
import java.util.stream.Collectors;
import io.jsonwebtoken.security.Keys;


/**
 * JSON Web Tokens for self-contained security tokens provider.
 * Uses Jsonwebtoken library to implement the API.
 * @see <a href="https://github.com/jwtk/jjwt">Jsonwebtoken library</a>
 */
@Slf4j
@Component
public class JwtTokenProvider {

    @Value("${security.jwt.token.secret-key}")
    private String secretKey;

    private Key key;

    @Value("#{${security.jwt.token.expire-minutes}}")
    private int validityInMilliseconds;

    @Autowired
    UserBlockList userBlockList;

    @PostConstruct
    protected void init() {
        key=Keys.hmacShaKeyFor(secretKey.getBytes(StandardCharsets.UTF_8));
    }


    /**
     * The method is called by the controller {@link JWTUserController}
     * and uses already authenticated user's object to derive a name and a role and put these
     * fields together with an expiration time into the Claim. Then the claim is encrypted
     * and used to build a JWT token. IP address is also stored in it in order to prevent
     * token hacking. Expiration time and the secrete key are got from Spring properties.
     * @param user - UserDetails implementing object.
     * @param ip
     * @return created JWT token string.
     */
    public String createToken(Object user, String ip) {

        Claims claims = Jwts.claims().setSubject(((User)user).getUsername());
        claims.put("ip", ip);
        claims.put("auth", ((User) user).getAuthorities());
        log.info("set user="+((User) user).getUsername());
        log.info("set ip="+ip);
        log.info("set auth="+((User) user).getAuthorities());

        Date now = new Date();
        Date validity = new Date(now.getTime() + validityInMilliseconds);

        return Jwts.builder()
                .setClaims(claims)
                .setExpiration(validity)
                .signWith(key)
                .compact();
    }


    /**
     * The method is used in a security filter chain {@link JwtTokenFilter}
     * to construct a context containing an Authentication derived form a token.
     * @param token
     * @return authentication object
     */
    public Authentication getAuthentication(String token) {
        String user = Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token).getBody().getSubject();
        Collection<Map<String,String>> auth = (Collection<Map<String,String>>) Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token).getBody().get("auth");
        Collection<SimpleGrantedAuthority> newAuth = auth.stream().map(x->new SimpleGrantedAuthority(x.get("authority"))).collect(Collectors.toList());
        log.info("Authenticated based on token="+newAuth);
        return new UsernamePasswordAuthenticationToken(user, "", newAuth);
    }

    /**
     * Extracts a token string from a request Header string.
     * @param req
     * @return token string
     */
    public String resolveToken(HttpServletRequest req) {
        String bearerToken = req.getHeader("Authorization");
        if (bearerToken != null && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return null;
    }

    /**
     * Validate a token based on parsing and extracting info from it into a Claim.
     * Additionally, compares an IP mentioned in a token and actual IP and check for a presence
     * of a User in a blocked user list (User is blocked when logged out following a protocol
     * implemented {@link UserService}). If validation fails throws UserAuthException which is
     * to be handled in rest controller.
     * @param token
     * @param httpServletRequest
     * @return validation status as boolean
     */
    public boolean validateToken(String token, HttpServletRequest httpServletRequest) {
        try {
            Claims cl=Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token).getBody();
            return checkAdditionally(cl, httpServletRequest);
        } catch (JwtException | IllegalArgumentException e) {
            throw new UserAuthException("Expired or invalid JWT token", HttpStatus.UNAUTHORIZED);
        }
    }

    /**
     * Helper method. Checks if IP is forged or AppUser is blocked.
     * @param cl
     * @param httpServletRequest
     * @return validation status as boolean.
     */
    private boolean checkAdditionally(Claims cl, HttpServletRequest httpServletRequest){
        log.info("get ip="+cl.get("ip"));
        log.info("actual ip="+httpServletRequest.getRemoteAddr());
        log.info("get auth="+cl.get("auth"));
        if (userBlockList.findById(cl.getSubject()).isPresent()) return false;
        return cl.get("ip").equals(httpServletRequest.getRemoteAddr());
    }
}

