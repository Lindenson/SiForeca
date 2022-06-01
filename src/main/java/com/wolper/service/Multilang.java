package com.wolper.service;



public interface Multilang {
    enum SLANG {
        EINTER,
        UINTER,
        RINTER;
    }
    String UA = "uk-UA";
    String RU = "ru-RU";
    String getCode();
    String getEname();
    String getUname();
    String getRname();
}
