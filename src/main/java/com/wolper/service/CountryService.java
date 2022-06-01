package com.wolper.service;

import model.CodeAndName;

import java.util.List;

public interface CountryService {
    List<String> getCountryNames();

    List<CodeAndName> findAllReplaced(String lang);
}
