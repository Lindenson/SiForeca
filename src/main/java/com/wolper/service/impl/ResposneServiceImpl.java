package com.wolper.service.impl;

import com.wolper.dto.*;
import com.wolper.repositories.*;
import com.wolper.service.Multilang;
import com.wolper.service.ResposneService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.validation.constraints.Max;
import java.util.*;
import java.util.stream.Collectors;
import static com.wolper.service.Multilang.RU;
import static com.wolper.service.Multilang.UA;


@Slf4j
@Service
@AllArgsConstructor
public class ResposneServiceImpl implements ResposneService {

    final IndicatorRepo indicatorRepo;
    final CountryRepo countryRepo;
    final UnitRepo unitRepo;
    final ActivityRepo activityRepo;
    final SectorRepo sectorRepo;

    @Override
    public void replaceIndName(MapOfIndicators mapI, Multilang.SLANG slang){
        try {
            List<Indicator> all = indicatorRepo.findAll();
            mapI.stream()
                    .forEach(it -> {
                        Optional<Indicator> first = all.stream().filter(es -> es.getCode().equals(it.getIname())).findFirst();
                        if (first.isPresent()) it.setIname(interfacer(first.get(), slang));
                        replaceASNames(it, slang);
                        replaceUnitName(it.getIdata(), slang);
                    });
        }
        catch (Exception ex) {
            log.error(ex.getMessage());
        }
    }

    @Override
    public void replaceContNameIndName(MapOfTime mapC, Multilang.SLANG slang){
        try {
            List<Indicator> all = indicatorRepo.findAll();
            List<Country> allC = countryRepo.findAll();
            mapC.stream()
                    .forEach(it -> {
                        Optional<Country> firstC = allC.stream().filter(es -> es.getCode().equals(it.getCname())).findFirst();
                        if (firstC.isPresent()) it.setCname(interfacer(firstC.get(), slang));
                        replaceASNames(it, slang);
                        replaceUnitName(it.getCdata(), slang);
                        it.getCdata().stream().forEach(
                                is-> {
                                    Optional<Indicator> first = all.stream().filter(es -> es.getCode().equals(is.getIname())).findFirst();
                                    if (first.isPresent()) is.setIname(interfacer(first.get(), slang));
                                }
                        );
                    });
        } catch (Exception ex) {
            log.error(ex.getMessage());
        }
    }


    @Override
    public void replaceContName(MapOfCountries mapC, Multilang.SLANG slang) {
        try {
            List<Country> all = countryRepo.findAll();
            mapC.stream()
                    .forEach(it -> {
                        Optional<Country> first = all.stream().filter(es -> es.getCode().equals(it.getCname())).findFirst();
                        if (first.isPresent()) it.setCname(interfacer(first.get(),slang));
                        replaceASNames(it, slang);
                        replaceUnitName(it.getCdata(), slang);
                    });
        } catch (Exception ex) {
            log.error(ex.getMessage());
        }
    }


    @Override
    public String interfacer(Multilang o, Multilang.SLANG lang) {
        String trName=null;
        switch (lang) {
            case UINTER -> {trName= o.getUname();}
            case RINTER -> {trName= o.getRname();}
            default -> {trName= o.getEname();}
        }
        if (Objects.isNull(trName)) return o.getEname();
        else return trName;
    }

    @Override
    public Multilang.SLANG resolvLang(String lang) {
        if (!StringUtils.hasText(lang)) lang="default";
        switch (lang) {
            case UA -> {return Multilang.SLANG.UINTER;}
            case RU -> {return Multilang.SLANG.RINTER;}
            default -> {return Multilang.SLANG.EINTER;}
        }
    }


    @Override
    public void replaceUnitName(List<?> start, Multilang.SLANG slang) {
        List<Unit> allU = unitRepo.findAll();
        Object tester = null;
        if (start.size()>0) tester=start.get(0);
        switch (tester) {
            case YearAndInd it -> {
                List<YearAndInd> tested = (List<YearAndInd>)start;
                tested.stream()
                        .forEach(et->{
                            Optional<Unit> firstU = allU.stream().filter(er -> er.getCode().equals(et.getUnit())).findFirst();
                            if (firstU.isPresent()) et.setUnit(interfacer(firstU.get(),slang));
                        });
            }
            case DataAndInd it -> {
                List<DataAndInd> tested = (List<DataAndInd>)start;
                tested.stream()
                        .forEach(et->{
                            Optional<Unit> firstU = allU.stream().filter(er -> er.getCode().equals(et.getUnit())).findFirst();
                            if (firstU.isPresent()) et.setUnit(interfacer(firstU.get(),slang));
                        });
            }
            default -> throw new IllegalStateException("Unexpected value: " + tester);
        }
    }


    @Override
    public void replaceASNames(Object start, Multilang.SLANG slang) {
        List<Activity> allA = activityRepo.findAll();
        List<Sector> allS = sectorRepo.findAll();

        switch (start) {
            case MapOfIndicatorsInner it -> {
                MapOfIndicatorsInner tested = (MapOfIndicatorsInner) it;
                Optional<Activity> firstA = allA.stream().filter(el -> el.getCode().equals(it.getAname())).findFirst();
                if (firstA.isPresent()) tested.setAname(interfacer(firstA.get(), slang));
                Optional<Sector> firstS = allS.stream().filter(em -> em.getCode().equals(it.getSname())).findFirst();
                if (firstS.isPresent()) tested.setSname(interfacer(firstS.get(), slang));
            }
            case MapOfTimeInner it -> {
                MapOfTimeInner tested = (MapOfTimeInner) it;
                Optional<Activity> firstA = allA.stream().filter(el -> el.getCode().equals(it.getAname())).findFirst();
                if (firstA.isPresent()) tested.setAname(interfacer(firstA.get(), slang));
                Optional<Sector> firstS = allS.stream().filter(em -> em.getCode().equals(it.getSname())).findFirst();
                if (firstS.isPresent()) tested.setSname(interfacer(firstS.get(), slang));
            }

            case MapOfCountriesInner it -> {
                MapOfCountriesInner tested = (MapOfCountriesInner) it;
                Optional<Activity> firstA = allA.stream().filter(el -> el.getCode().equals(it.getAname())).findFirst();
                if (firstA.isPresent()) tested.setAname(interfacer(firstA.get(), slang));
                Optional<Sector> firstS = allS.stream().filter(em -> em.getCode().equals(it.getSname())).findFirst();
                if (firstS.isPresent()) tested.setSname(interfacer(firstS.get(), slang));
            }

            default -> throw new IllegalStateException("Unexpected value: " + start);
        }
    }

    @Override
    public <T extends Multilang> List<CodeAndName> allReplacedHelper(String lang, List<T> all){
        return all.stream()
                .map(it-> {
                    CodeAndName codeAndName = new CodeAndName();
                    codeAndName.setCode(it.getCode());
                    codeAndName.setName(interfacer(it, resolvLang(lang)));
                    return codeAndName;
                }).collect(Collectors.toList());
    }


    @Override
    public Map<String, Map<String, List<String>>> replaceAndSortForTreeList(Map<String, Map<String, List<String>>> initMap, Multilang.SLANG slang) {
        List<Indicator> allI = indicatorRepo.findAll();
        List<Activity> allA = activityRepo.findAll();
        List<Sector> allS = sectorRepo.findAll();

        TreeMap<String, Map<String, List<String>>> sortedMap = new TreeMap<>();
        initMap.keySet().stream().forEach(it->{
            Optional<Indicator> indRenamed = allI.stream().filter(es -> es.getCode().equals(it)).findFirst();
            String name=it;
            if (indRenamed.isPresent()) name=interfacer(indRenamed.get(), slang);
            TreeMap<String, List<String>> sortedInner = new TreeMap<>();
            Map<String, List<String>> unsortedInner = initMap.get(it);
            unsortedInner.keySet().stream().forEach(its-> {
                Optional<Sector> secRenamed = allS.stream().filter(es -> es.getCode().equals(its)).findFirst();
                String nameSecond = its;
                if (indRenamed.isPresent()) nameSecond = interfacer(secRenamed.get(), slang);
                TreeMap<String, List<String>> sortedInnerInner = new TreeMap<>();
                List<String> sortedActivities = unsortedInner.get(its).stream().map(itr-> {
                    var aRenamed = allA.stream().filter(es -> es.getCode().equals(itr)).findFirst();
                    if (aRenamed.isPresent()) return interfacer(aRenamed.get(), slang);
                    return itr;
                }).sorted().collect(Collectors.toList());
                sortedInner.put(nameSecond, sortedActivities);
            });
            sortedMap.put(name, sortedInner);
        });
        return sortedMap;
    }
}
