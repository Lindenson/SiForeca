package com.wolper.controllers.swagger;

import api.*;
import com.wolper.service.*;
import com.wolper.service.impl.*;
import lombok.AllArgsConstructor;
import model.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/v1")
@AllArgsConstructor
public class SwaggerController implements CountriesApi, IndicatorsApi, IndicatorApi, YearsApi, CountryApi, YearApi, ActivitiesApi, SectorApi {

    private final CountryService countryService;
    private final IndicatorService indicatorService;
    private final GrossbuchService grossbuchService;
    private final ActivityService activityService;
    private final SectorServiceImpl sectorService;
    private final ResposneService resposneService;


    @Override
    public ResponseEntity<List<CodeAndName>> getCountrs(String contentLanguage) {
        List<CodeAndName> countryNames = countryService.findAllReplaced(contentLanguage);
        return new ResponseEntity<>(countryNames, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<CodeAndName>> getInds(String contentLanguage) {
        List<CodeAndName> indicatorNames = indicatorService.findAllReplaced(contentLanguage);
        return new ResponseEntity<>(indicatorNames, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<Integer>> getYears(String contentLanguage) {
        return new ResponseEntity<>(grossbuchService.getAllYearsList(), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<MapOfIndicators> getCountr(String sector, String activity, String cname, String contentLanguage) {
        MapOfIndicators dataForOneCountry = grossbuchService.getDataForOneCountry(cname, sector, activity);
        resposneService.replaceIndName(dataForOneCountry, resposneService.resolvLang(contentLanguage));
        return new ResponseEntity<>(dataForOneCountry, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<MapOfCountries> getInd(String sector, String activity, String iname, String contentLanguage) {
        MapOfCountries dataForOneCountry = grossbuchService.getDataForOneIndicator(iname, sector, activity);
        resposneService.replaceContName(dataForOneCountry, resposneService.resolvLang(contentLanguage));
        return new ResponseEntity<>(dataForOneCountry, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<MapOfTime> getYear(String sector, String activity, Integer date, String contentLanguage) {
        MapOfTime dataForOneYear = grossbuchService.getDataForOneYear(date, sector, activity);
        resposneService.replaceContNameIndName(dataForOneYear, resposneService.resolvLang(contentLanguage));
        return new ResponseEntity<>(dataForOneYear, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<ForTreeList> getActivity(String contentLanguage) {
        Map<String, Map<String, List<String>>> first = grossbuchService.getMappedSectorAndActivity();
        Map<String, Map<String, List<String>>> second = resposneService.replaceAndSortForTreeList(first, resposneService.resolvLang(contentLanguage));
        return new ResponseEntity<>(grossbuchService.getMappedSectorAndActivityForMenuTree(second), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<CodeAndName>> getActivities(String contentLanguage) {
        List<CodeAndName> activityNames = activityService.findAllReplaced(contentLanguage);
        return new ResponseEntity<>(activityNames, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<CodeAndName>> getSectors(String contentLanguage) {
        List<CodeAndName> sectorNames = sectorService.findAllReplaced(contentLanguage);
        return new ResponseEntity<>(sectorNames, HttpStatus.OK);
    }
}



