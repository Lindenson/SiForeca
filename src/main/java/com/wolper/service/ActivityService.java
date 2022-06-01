package com.wolper.service;

import model.CodeAndName;

import java.util.List;

public interface ActivityService {
    List<String> getActivityNames();

    List<CodeAndName> findAllReplaced(String lang);
}
