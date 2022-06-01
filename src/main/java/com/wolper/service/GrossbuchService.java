package com.wolper.service;

import model.MapOfActivities;
import model.MapOfCountries;
import model.MapOfIndicators;
import model.MapOfTime;

import java.util.List;

public interface GrossbuchService {
    List<Integer> getAllYearsList();

    MapOfIndicators getDataForOneCountry(String countryCode, String sector, String activity);

    MapOfCountries getDataForOneIndicator(String indicator, String sector, String activity);

    MapOfTime getDataForOneYear(Integer year, String sector, String activity);

    List<MapOfActivities> getMappedSectorAndActivity();
}
