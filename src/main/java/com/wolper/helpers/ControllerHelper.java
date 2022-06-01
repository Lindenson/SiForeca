package com.wolper.helpers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

public class ControllerHelper {

    public static String getUrl(String add){
        return ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString()+add;
    }

    public static String getRole(){
        return getAuth().getAuthorities().stream()
                .map(r -> r.getAuthority())
                .filter(r -> r.equals("ROLE_ADMIN"))
                .findAny().orElse("ROLE_USER");
    }

    public static String getName(){
        return getAuth().getPrincipal().toString();
    }

    public static Authentication getAuth(){
        return  SecurityContextHolder.getContext().getAuthentication();
    }
}
