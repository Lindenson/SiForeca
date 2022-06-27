package com.wolper.service;

import com.wolper.dto.PairStrings;
import model.*;

import java.util.List;
import java.util.Map;

public interface GrossbuchService {

    enum MapedDependings {
        INDICATOR, COUNTRY, YEAR
    }

    List<Integer> getAllYearsList();

    MapOfIndicators getDataForOneCountry(String countryCode, String sector, String activity);

    MapOfCountries getDataForOneIndicator(String indicator, String sector, String activity);

    MapOfTime getDataForOneYear(Integer year, String sector, String activity);

    Map<String, Map<String, List<String>>> getMappedSectorAndActivity(MapedDependings depending);

    ForTreeList getMappedSectorAndActivityForMenuTree(Map<String, Map<String, List<PairStrings>>> beforeResult);
}
