package com.wolper.service;

import model.*;

import java.util.List;
import java.util.Map;

public interface ResposneService {
    void replaceIndName(MapOfIndicators mapI, Multilang.SLANG slang);

    void replaceContNameIndName(MapOfTime mapC, Multilang.SLANG slang);

    void replaceContName(MapOfCountries mapC, Multilang.SLANG slang);

    String interfacer(Multilang o, Multilang.SLANG lang);

    Multilang.SLANG resolvLang(String lang);

    void replaceUnitName(List<?> start, Multilang.SLANG slang);

    void replaceASNames(Object start, Multilang.SLANG slang);

    <T extends Multilang> List<CodeAndName> allReplacedHelper(String lang, List<T> all);

    Map<String, Map<String, List<String>>> replaceAndSortForTreeList(Map<String, Map<String, List<String>>> initMap, Multilang.SLANG slang);
}
