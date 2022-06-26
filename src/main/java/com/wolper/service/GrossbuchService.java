package com.wolper.service;

import model.*;

import java.util.List;
import java.util.Map;

public interface GrossbuchService {
    List<Integer> getAllYearsList();

    MapOfIndicators getDataForOneCountry(String countryCode, String sector, String activity);

    MapOfCountries getDataForOneIndicator(String indicator, String sector, String activity);

    MapOfTime getDataForOneYear(Integer year, String sector, String activity);

    Map<String, Map<String, List<String>>> getMappedSectorAndActivity();

    ForTreeList getMappedSectorAndActivityForMenuTree(Map<String, Map<String, List<String>>> beforeResult);
}
