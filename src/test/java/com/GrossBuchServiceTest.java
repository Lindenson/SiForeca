package com;

import com.wolper.dto.Grossbuch;
import com.wolper.dto.PairStrings;
import com.wolper.repositories.GrossbuchRepo;
import com.wolper.service.GrossbuchService;
import com.wolper.service.Multilang;
import com.wolper.service.impl.GrossbuchServiceImpl;
import lombok.extern.log4j.Log4j2;
import model.*;
import org.junit.Ignore;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


@Log4j2
@ActiveProfiles("test")
@ExtendWith(MockitoExtension.class)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)


public class GrossBuchServiceTest {

    @Mock
    private GrossbuchRepo grossbuchRepo;
    private GrossbuchServiceImpl grossbuchService;
    private static List<Grossbuch> gbList = null;
    private final static int TESTYEAR=2012;

    @BeforeAll
    private static void setup() {
        createGrossbuchesList();
    }

    @BeforeEach
    private void tuneup() {
        this.grossbuchService = new GrossbuchServiceImpl(grossbuchRepo);
    }

    @Test
    void repositoryWorks() {
        Mockito.when(grossbuchRepo.findAll()).thenReturn(gbList);
        List<Grossbuch> all = grossbuchRepo.findAll();
        assertEquals(all.size(), gbList.size());
    }

    @Test
    void serviceWorks() {
        Mockito.when(grossbuchRepo.findAllYears()).thenReturn(gbList.stream().map(Grossbuch::getDate).map(LocalDate::getYear).collect(Collectors.toList()));
        List<Integer> allYearsList = grossbuchService.getAllYearsList();
        assertEquals(allYearsList.get(0).longValue(), TESTYEAR);
    }

    @Test
    void getDataForOneCountryTest() {
        //SUPPOSE: we have a list of Grossbuch records
        String countryWithMaxData = gbList.stream().collect(Collectors.groupingBy(Grossbuch::getCountry)).entrySet().stream().max((it, ti) ->
                Integer.compare(it.getValue().size(), ti.getValue().size())).get().getKey();
        List<Grossbuch> listForCountry = gbList.stream().filter(it -> it.getCountry().equals(countryWithMaxData)).collect(Collectors.toList());
        String sectorWithMAxData = listForCountry.stream().collect(Collectors.groupingBy(Grossbuch::getSector)).entrySet().stream().max((it, ti) ->
                Integer.compare(it.getValue().size(), ti.getValue().size())).get().getKey();
        List<Grossbuch> listForSector = listForCountry.stream().filter(it -> it.getSector().equals(sectorWithMAxData)).collect(Collectors.toList());
        Mockito.when(grossbuchRepo.findAllByCountryAndSectorAndActivity(Mockito.eq(countryWithMaxData), Mockito.eq(sectorWithMAxData), Mockito.anyString())).thenReturn(listForSector);

        //WHEN: we query the GrossbuchService
        var countryData = grossbuchService.getDataForOneCountry(countryWithMaxData, sectorWithMAxData, "ANY").stream().map(it->it.getIname()).collect(Collectors.toList());
        var countryDataOrigin = listForSector.stream().map(Grossbuch::getIndicator).distinct().collect(Collectors.toList());

        //THEN:
        //we get all Indicators
        assertEquals(countryDataOrigin.size(), countryData.size());
        assertTrue(countryDataOrigin.containsAll(countryData));
    }



    @Test
    void getDataForOneIndicatorTest() {
        String indicatorWithMaxData = gbList.stream().collect(Collectors.groupingBy(Grossbuch::getIndicator)).entrySet().stream().max((it, ti) ->
                Integer.compare(it.getValue().size(), ti.getValue().size())).get().getKey();
        List<Grossbuch> listForIndicator = gbList.stream().filter(it -> it.getIndicator().equals(indicatorWithMaxData)).collect(Collectors.toList());
        String sectorWithMAxData = listForIndicator.stream().collect(Collectors.groupingBy(Grossbuch::getSector)).entrySet().stream().max((it, ti) ->
                Integer.compare(it.getValue().size(), ti.getValue().size())).get().getKey();
        List<Grossbuch> listForSector = listForIndicator.stream().filter(it -> it.getSector().equals(sectorWithMAxData)).collect(Collectors.toList());
        Mockito.when(grossbuchRepo.findAllByIndicatorAndSectorAndActivity(Mockito.eq(indicatorWithMaxData), Mockito.eq(sectorWithMAxData), Mockito.anyString())).thenReturn(listForSector);
        var indicatorData = grossbuchService.getDataForOneIndicator(indicatorWithMaxData,sectorWithMAxData,"ANY").stream().map(it -> it.getCname()).collect(Collectors.toList());
        var indicatorDataOrigin = listForSector.stream().map(Grossbuch::getCountry).distinct().collect(Collectors.toList());

        assertEquals(indicatorData.size(),indicatorDataOrigin.size());
        assertTrue(indicatorData.containsAll(indicatorDataOrigin));
        assertTrue(indicatorDataOrigin.containsAll(indicatorData));
    }

    @Test
    void getDataForOneYearTest() {
        LocalDate DateWithMaxData = gbList.stream().collect(Collectors.groupingBy(Grossbuch::getDate)).entrySet().stream().max((it, ti) ->
                Integer.compare(it.getValue().size(), ti.getValue().size())).get().getKey();
        int YearWithMaxData = DateWithMaxData.getYear();
        List<Grossbuch> listForYear = gbList.stream().filter(it -> it.getDate().getYear() == YearWithMaxData ).collect(Collectors.toList());
        String sectorWithMAxData = listForYear.stream().collect(Collectors.groupingBy(Grossbuch::getSector)).entrySet().stream().max((it, ti) ->
                Integer.compare(it.getValue().size(), ti.getValue().size())).get().getKey();
        List<Grossbuch> listForSector = listForYear.stream().filter(it -> it.getSector().equals(sectorWithMAxData)).collect(Collectors.toList());
        Mockito.when(grossbuchRepo.findAllByDateYear(Mockito.eq(YearWithMaxData), Mockito.eq(sectorWithMAxData), Mockito.anyString())).thenReturn(listForSector);
        var YearData = grossbuchService.getDataForOneYear(YearWithMaxData,sectorWithMAxData,"ANY").stream().map(it -> it.getCname()).collect(Collectors.toList());
        var YearDataOrigin = listForSector.stream().map(Grossbuch::getCountry).distinct().collect(Collectors.toList());

        assertEquals(YearData.size(),YearDataOrigin.size());
        assertTrue(YearData.containsAll(YearDataOrigin));
        assertTrue(YearDataOrigin.containsAll(YearData));
    }


    @ParameterizedTest
    @ValueSource(strings = {"INDICATOR", "COUNTRY", "YEAR"})
    void getNewMappedSectorAndActivityTest(String parameter) {
        //SUPPOSE: repo returns unique indicator+sector+activity combination
        GrossbuchService.MapedDependings toTest = GrossbuchService.MapedDependings.valueOf(parameter);
        Set <String> checklist = new HashSet<>();
        var uniqueList = gbList.stream().filter(prepareUniqueListFilter(toTest, checklist, true)).collect(Collectors.toList());
        Set<String> allIndicatorsUniqueOrigin = null;
        switch (toTest) {
            case INDICATOR: allIndicatorsUniqueOrigin=uniqueList.stream().map(Grossbuch::getIndicator).collect(Collectors.toSet()); break;
            case COUNTRY: allIndicatorsUniqueOrigin=uniqueList.stream().map(Grossbuch::getCountry).collect(Collectors.toSet()); break;
            case YEAR: allIndicatorsUniqueOrigin=uniqueList.stream().map(it->String.valueOf(it.getDate().getYear())).collect(Collectors.toSet()); break;
        }
        checklist.clear();
        var allSectorsUniqueOrigin = uniqueList.stream().filter(prepareUniqueListFilter(toTest, checklist, false))
                .map(Grossbuch::getSector).collect(Collectors.toList());
        var allActivitiesOrigin = uniqueList.stream().map(Grossbuch::getActivity).collect(Collectors.toList());

        switch (toTest) {
            case INDICATOR: Mockito.when(grossbuchRepo.findAllIndicatorsGroupedBySectorAndActivity()).thenReturn(uniqueList); break;
            case COUNTRY: Mockito.when(grossbuchRepo.findAllCountriesGroupedBySectorAndActivity()).thenReturn(uniqueList); break;
            case YEAR: Mockito.when(grossbuchRepo.findAllYearsGroupedBySectorAndActivity()).thenReturn(uniqueList); break;
        }

        //WHEN: we query the GrossbuchService
        ForTreeList result = grossbuchService.getMappedSectorAndActivityForMenuTree(
                pairHelper(grossbuchService.getMappedSectorAndActivity(toTest)));

        var allIndicators = result.stream().map(it-> {
            switch (it) {
                case ForTreeListItem itt -> {return itt.getText();}
                case ForTreeListEmptyItem itt -> {return itt.getText();}
                default -> throw new IllegalStateException("Unexpected value: " + it);
            }
        }).collect(Collectors.toList());

        var allSectors = result.stream().flatMap(it -> {
            switch (it) {
                case ForTreeListItem itt -> {return itt.getItems().stream().map(irr-> {
                    switch (irr) {
                        case ForTreeListItem izz -> {return izz.getText();}
                        case ForTreeListEmptyItem izz -> {return izz.getText();}
                        default -> throw new IllegalStateException("Unexpected value: " + it);
                    }});}
                case ForTreeListEmptyItem itt -> {return Stream.empty();}
                default -> throw new IllegalStateException("Unexpected value: " + it);
            }
        }).collect(Collectors.toList());

        var allActivities = result.stream().flatMap(it -> {
            switch (it) {
                case ForTreeListItem itt -> {return itt.getItems().stream();}
                case ForTreeListEmptyItem itt -> {return Stream.empty();}
                default -> throw new IllegalStateException("Unexpected value: " + it);
            }
        }).flatMap(it -> {
            switch (it) {
                case ForTreeListItem itt -> {return itt.getItems().stream().map(ioo->{
                    switch (ioo) {
                        case ForTreeListItem iqq -> {return iqq.getText();}
                        case ForTreeListEmptyItem iqq -> {return iqq.getText();}
                        default -> throw new IllegalStateException("Unexpected value: " + it);
                    }});}
                case ForTreeListEmptyItem itt -> {return Stream.empty();}
                default -> throw new IllegalStateException("Unexpected value: " + it);
            }
        }).collect(Collectors.toList());

        //THEN: OUR RESPONSE COINCIDES WITH EXPECTATIONS IN SIZE AND CONTENT
        assertEquals(allIndicatorsUniqueOrigin.size(), allIndicators.size());
        assertTrue(allIndicatorsUniqueOrigin.containsAll(allIndicators));
        assertEquals(allSectorsUniqueOrigin.size(), allSectors.size());
        assertTrue(allSectorsUniqueOrigin.containsAll(allSectors));
        assertEquals(allActivities.size(), allActivitiesOrigin.size());
        assertTrue(allActivities.containsAll(allActivitiesOrigin));
    }


    private static void createGrossbuchesList() {
        String[] listUNIQ = {"A","B","C","D","E", "F"};
        List<String> uniqList = IntStream.range(1, 36).mapToObj(it -> listUNIQ[ThreadLocalRandom.current().nextInt(0, listUNIQ.length)] +
                listUNIQ[ThreadLocalRandom.current().nextInt(0, listUNIQ.length)] +
                listUNIQ[ThreadLocalRandom.current().nextInt(0, listUNIQ.length)] +
                listUNIQ[ThreadLocalRandom.current().nextInt(0, listUNIQ.length)]).collect(Collectors.toList());

        gbList = IntStream.range(1, 360).mapToObj(it ->
                new Grossbuch(Long.valueOf(it), LocalDate.of(TESTYEAR, it % 12+1, it % 28+1), new BigDecimal(ThreadLocalRandom.current().nextDouble()),
                        uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())),
                        uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())),
                        uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())),
                        uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())),
                        "ACT_"+uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())),
                        uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())),
                        "SEQ_"+uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())),
                        "IND_"+uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())),
                        uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())),
                        uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())),
                        uniqList.get(ThreadLocalRandom.current().nextInt(0, uniqList.size())))
        ).collect(Collectors.toList());
    }

    private Map<String, Map<String, List<PairStrings>>> pairHelper(Map<String, Map<String, List<String>>> init){
        return init.keySet().stream().collect(Collectors.toMap(Function.identity(),
                    it->{
                        var map = init.get(it);
                        return map.keySet().stream().collect(Collectors.toMap(Function.identity(),
                            is-> {
                                return init.get(it).get(is).stream().map(ir->new PairStrings(ir, ir)).collect(Collectors.toList());
                            }));
                    }));
    }

    private Predicate<Grossbuch> prepareUniqueListFilter(GrossbuchService.MapedDependings md, Set <String> checklist, boolean withActivity) {
        switch (md) {
            case INDICATOR -> {
                return it -> {
                    if (!checklist.contains(it.getIndicator() + it.getSector() + (withActivity?it.getActivity():""))) {
                        checklist.add(it.getIndicator() + it.getSector() + (withActivity?it.getActivity():""));
                        return true;
                    }
                    return false;
                };
            }
            case COUNTRY -> {
                return it -> {
                    if (!checklist.contains(it.getCountry() + it.getSector() + (withActivity?it.getActivity():""))) {
                        checklist.add(it.getCountry() + it.getSector() + (withActivity?it.getActivity():""));
                        return true;
                    }
                    return false;
                };
            }
            case YEAR -> {
                return it -> {
                    String year = String.valueOf(it.getDate().getYear());
                    if (!checklist.contains(year + it.getSector() + (withActivity?it.getActivity():""))) {
                        checklist.add(year + it.getSector() + (withActivity?it.getActivity():""));
                        return true;
                    }
                    return false;
                };
            }
            default -> throw new IllegalStateException("wrong enum for prepareUniqueListFilter");}

    }
}
