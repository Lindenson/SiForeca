package com.wolper.controllers;

import com.wolper.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * A simple unsecured entry point to load all static resources.
 * The static files implement a frontend logic.
 * This web application in a pure REST.
 * It is scheduled to use reverse proxy NGINX.
 * Thereafter, the static content is to be moved and this controller deleted.
 */
@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class MainController  {

    private final UserService userService;

    @GetMapping
    public String mainPage() {
        return "index.html";
    }

}
