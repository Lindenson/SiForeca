package com.wolper.service;

import model.CodeAndName;

import java.util.List;

public interface IndicatorService {
    List<String> getIndicatorNames();

    List<CodeAndName> findAllReplaced(String lang);
}
