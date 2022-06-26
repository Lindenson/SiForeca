package com.wolper.service.impl;

import com.wolper.dto.Grossbuch;
import com.wolper.repositories.GrossbuchRepo;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import model.*;
import org.springframework.stereotype.Service;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Slf4j
@Service
@AllArgsConstructor
public class GrossbuchServiceImpl implements com.wolper.service.GrossbuchService {

    private final GrossbuchRepo grossbuch;

    @Override
    public List<Integer> getAllYearsList() {
        return grossbuch.findAllYears();
    }

    @Override
    public MapOfIndicators getDataForOneCountry(String countryCode, String sector, String activity) {
        MapOfIndicators mapC = new MapOfIndicators();
        try {
            List<Grossbuch> allByCountry = grossbuch.findAllByCountryAndSectorAndActivity(countryCode, sector, activity);
            Map<String, ArrayList<YearAndInd>> mapCI  = createMap(allByCountry, false);
            List<MapOfIndicatorsInner> collect1 = mapCI.keySet().stream()
                    .map(it -> {
                        MapOfIndicatorsInner mapOfIndicatorsInner = new MapOfIndicatorsInner();
                        mapOfIndicatorsInner.setIname(it);
                        mapOfIndicatorsInner.setIdata(mapCI.get(it));
                        mapOfIndicatorsInner.setAname(activity);
                        mapOfIndicatorsInner.setSname(sector);
                        return mapOfIndicatorsInner;
                    }).collect(Collectors.toList());
            mapC.addAll(collect1);

        } catch (Exception ex) {
            log.error(ex.getMessage());
            return new MapOfIndicators();
        }
        return mapC;
    }

    @Override
    public MapOfCountries getDataForOneIndicator(String indicator, String sector, String activity) {
        MapOfCountries mapI = new MapOfCountries();
        try {
            List<Grossbuch> allByIndicator = grossbuch.findAllByIndicatorAndSectorAndActivity(indicator, sector, activity);
            Map<String, ArrayList<YearAndInd>> mapII  = createMap(allByIndicator, true);
            List<MapOfCountriesInner> collect1 = mapII.keySet().stream()
                    .map(it -> {
                        MapOfCountriesInner mapOfIndicatorsInner = new MapOfCountriesInner();
                        mapOfIndicatorsInner.setCname(it);
                        mapOfIndicatorsInner.setCdata(mapII.get(it));
                        mapOfIndicatorsInner.setAname(activity);
                        mapOfIndicatorsInner.setSname(sector);
                        return mapOfIndicatorsInner;
                    }).collect(Collectors.toList());
            mapI.addAll(collect1);
        } catch (Exception ex) {
            log.error(ex.getMessage());
            return new MapOfCountries();
        }
        return mapI;
    }


    @Override
    public MapOfTime getDataForOneYear(Integer year, String sector, String activity) {
        MapOfTime mapI = new MapOfTime();
        try {
            List<Grossbuch> allByCountry = grossbuch.findAllByDateYear(year, sector, activity);
            Map<String, ArrayList<DataAndInd>> collect = allByCountry.stream()
                    .collect(Collectors.toMap(Grossbuch::getCountry, is -> {
                                ArrayList<DataAndInd> yearAndInds = new ArrayList<>();
                                DataAndInd y = new DataAndInd();
                                y.setIname(is.getIndicator());
                                y.setIndicator(is.getData());
                                y.setUnit(is.getUnit());
                                y.setBranch(is.getBranch());
                                yearAndInds.add(y);
                                return yearAndInds;
                            },
                            (is1, is2) -> {
                                is1.addAll(is2);
                                return is1;
                            }));
            List<MapOfTimeInner> collect1 = collect.keySet().stream()
                    .map(it -> {
                        MapOfTimeInner mapOfTimeInner = new MapOfTimeInner();
                        mapOfTimeInner.setCname(it);
                        mapOfTimeInner.setCdata(collect.get(it));
                        mapOfTimeInner.setAname(activity);
                        mapOfTimeInner.setSname(sector);
                        return mapOfTimeInner;
                    }).collect(Collectors.toList());
            mapI.addAll(collect1);
        } catch (Exception ex) {
            log.error(ex.getMessage());
            return new MapOfTime();
        }
        return mapI;
    }

    @Override
    public List<MapOfActivities> getMappedSectorAndActivity() {
        List<MapOfActivities> mol = new ArrayList<>();
        List<Grossbuch> gb = grossbuch.findAllGroupedBySectorAndActivity();
        Map<String, Map<String, List<String>>> collect = gb.stream()
                .collect(Collectors.toMap(Grossbuch::getIndicator, it -> {
                    Map<String, List<String>> mapI = new HashMap<>();
                    ArrayList<String> strings = new ArrayList<>();
                    strings.add(it.getActivity());
                    mapI.put(it.getSector(), strings);
                    return mapI;
                }, (se, ze) -> {
                    Map<String, List<String>> mapR = new HashMap<>();
                    Stream.concat(ze.keySet().stream(), se.keySet().stream())
                            .forEach(it-> {
                                List<String> strings1 = se.get(it);
                                List<String> strings2 = ze.get(it);
                                List<String> lR = new ArrayList<>();
                                if (Objects.nonNull(strings1)) lR.addAll(strings1);
                                if (Objects.nonNull(strings2)) lR.addAll(strings2);
                                mapR.put(it, lR);
                            });
                    return mapR;
                }));

        collect.keySet().stream()
                .forEach(it-> {
                    MapOfActivities mo = new MapOfActivities();
                    mo.setSectors(new ArrayList<>());
                    collect.get(it).keySet().stream()
                                    .forEach(is-> {
                                        MapOfActivitiesSectors ms = new MapOfActivitiesSectors();
                                        ms.setSname(is);
                                        ms.setActivities(collect.get(it).get(is));
                                        mo.getSectors().add(ms);
                                    });
                    mo.setIndicator(it);
                    mol.add(mo);
                });
        return mol;
    }

    private Map<String, ArrayList<YearAndInd>> createMap(List<Grossbuch> all, boolean forCountry) {
        Function<Grossbuch, String> f = forCountry ? Grossbuch::getCountry : Grossbuch::getIndicator;
        return all.stream()
                .collect(Collectors.toMap(f, is -> {
                            ArrayList<YearAndInd> yearAndInds = new ArrayList<>();
                            YearAndInd y = new YearAndInd();
                            y.setYear(is.getDate().getYear());
                            y.setIndicator(is.getData());
                            y.setUnit(is.getUnit());
                            y.setBranch(is.getBranch());
                            yearAndInds.add(y);
                            return yearAndInds;
                        },
                        (is1, is2) -> {
                            is1.addAll(is2);
                            return is1;
                        }));
    }


    public List<Map<String, Object>> getMappedSectorAndActivityForMenuTree(List<MapOfActivities> map_init) {
        List<Map<String, Object>> map_res = new ArrayList<>();
        for (MapOfActivities mapIndActSect : map_init) {
            Map<String, Object> innerMap = new HashMap<>();
            map_res.add(innerMap);
            innerMap.put("text", mapIndActSect.getIndicator());
            List<Map<String, Object>> innerMapList = new ArrayList<>();
            innerMap.put("items", innerMapList);
            for (MapOfActivitiesSectors mapActSect : mapIndActSect.getSectors()) {
                Map<String, Object> innerInnerMap = new HashMap<>();
                innerMapList.add(innerInnerMap);
                innerInnerMap.put("text", mapActSect.getSname());
                List<Map<String, Object>> innerInnerInnerMapList = new ArrayList<>();
                innerInnerMap.put("items", innerInnerInnerMapList);
                for (String activity : mapActSect.getActivities()) {
                    Map<String, Object> innerInnerInnerMap = new HashMap<>();
                    innerInnerInnerMapList.add(innerInnerInnerMap);
                    innerInnerInnerMap.put("text", activity);
                }
            }
        }
        return map_res;
    }
}
