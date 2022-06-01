package com.wolper.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.wolper.dto.AppUser;
import com.wolper.exceptions.EMailException;
import com.wolper.exceptions.UserAuthException;
import com.wolper.helpers.ControllerHelper;
import com.wolper.repositories.UserBlockList;
import com.wolper.service.EMailService;
import com.wolper.service.UserService;
import com.wolper.service.impl.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.util.List;


/**
 * Rest controller for client management accounts management and security.
 * The concept is based on JWT self-contained security tokens (see a book bellow).
 * Once signed in by the respective method the client gets a JWT in a body of GET response.
 * JWT has to be specified in appropriate request header to access all secured api methods.
 * There are three roles used in the controller: ADMIN, USER and blank. ADMIN AND USER are
 * based on JWT signing. Blank (unauthorised) supposed for signing-in, creating a new account
 * and password recovery. The last two methods use another a simpler token, which is to be
 * embedded into e-mail sent for confirmation. It is not a real JWT, but just UUID.
 * It has to be specified during calling methods "confirmEmail" and "changePassword" as a
 * request parameter. After signing-in a user is not allowed to log in until he confirms email.
 * After logging out a user can not use a JWT anymore, despite the JWT has not been expired.
 * It is provided by adding a record to Redis DB. The presence of the record indicates that
 * a user has signed out. The record in Redis DB is deleted either when a user has signed in
 * again or after a specified time {@link UserBlockList}.
 * The actual service is implemented in {@link UserServiceImpl}
 * @see <a href="https://www.manning.com/books/api-security-in-action">API Security in Action</a>
 */
@Log4j2
@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
@CrossOrigin("*")
public class JWTUserController {

    private final UserService userService;
    private final EMailService eMailService;



    @PostMapping("/signin")
    public String login(
              HttpServletRequest request,
              @RequestParam String username,
              @RequestParam String password) {
        return userService.signin(username, password, request.getRemoteAddr());
    }


    @PostMapping("/delete")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    public String delete(@RequestParam String username) {
        if (ControllerHelper.getRole().equals("ROLE_ADMIN")
                || username.equals(ControllerHelper.getName()))
                                      userService.delete(username);
        return "{'result':'deleted'}";
    }

    @PostMapping("/signup")
    public String signup(
            @RequestParam String username, @RequestParam String password) {
            String token = userService.signup(username, password);
            String url = ControllerHelper.getUrl("/user/confirm?token="+token);
            eMailService.sendEmail("Confirm e-mail", url, username);
            return "{'result':'created temporary'}";
    }

    @GetMapping("/whoami")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    public AppUser whoami(HttpServletRequest req) {
        AppUser user = userService.whoami(ControllerHelper.getName());
        user.setPassword("***");
        return user;
    }

    @GetMapping("/users")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    public Iterable<AppUser> getUsersList() {
        return userService.userList();
    }


    @PostMapping("/enable")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String enableUsersList(
            @RequestBody List<String> users) {
            userService.enableUserList(users);
            return "{'result':'enabled'}";
    }

    @PostMapping("/reset")
    public String resetPassword(@RequestParam("email") String user) {
        String token = userService.createEmailToken(user);
        String url = ControllerHelper.getUrl("/#/change-password/:recoveryCode="+token);
        eMailService.sendEmail("Reset password", url, user);
        return "{'result':'reset-mailed'}";
    }

    @PostMapping("/change")
    public String changePassword(@RequestParam("token") String token,
                                 @RequestParam("password") String password) {
        userService.setNewPasswordByToken(token, password);
        return "{'result':'changed'}";
    }

    @GetMapping("/logout")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    public String logout() {
        log.info("LOGOUT LOUNCHED");
        log.info(ControllerHelper.getName());
        userService.signOut(ControllerHelper.getName());
        return "{'result':'logout'}";
    }

    @GetMapping("/confirm")
    public void confirmEmail(@RequestParam("token") String token, HttpServletResponse res) throws IOException {
        userService.setNewPasswordByToken(token, null);
        res.sendRedirect("/#/home/:message=E-mail confirmed! You can log-in now");
    }


    @ExceptionHandler(UserAuthException.class)
    @ResponseStatus(code = HttpStatus.UNAUTHORIZED)
    public String handleUserError(HttpServletRequest req, Exception ex) {
        log.error(ex.getMessage());
        return ex.getMessage();
    }



    @ExceptionHandler(EMailException.class)
    @ResponseStatus(code = HttpStatus.BAD_REQUEST)
    public String handleEMailError(HttpServletRequest req, Exception ex) {
        log.error(ex.getMessage());
        return ex.getMessage();
    }

    @ExceptionHandler(DataAccessException.class)
    @ResponseStatus(code = HttpStatus.BAD_REQUEST)
    public String handleAllDBError(HttpServletRequest req, Exception ex) {
        log.error(ex.getMessage());
        return ex.getMessage();
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(code = HttpStatus.BAD_REQUEST)
    public String handleAllOtherError(HttpServletRequest req, Exception ex) {
        log.error(ex.getMessage());
        return ex.getMessage();
    }

}

