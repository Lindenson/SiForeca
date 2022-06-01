package com.wolper.service;

import javax.servlet.http.HttpServletRequest;
import  com.wolper.dto.AppUser;
import java.util.List;




public interface UserService {
    String signin(String username, String password, String ip);

    String signup(String username, String password);

    void delete(String username);

    AppUser whoami(String name);

    Iterable<AppUser> userList();

    void enableUserList(List<String> usList);

    String createEmailToken(String user);

    AppUser findUserByEmail(String userEmail);

    void setNewPasswordByToken(String token, String password);

    void signOut(String name);
}
