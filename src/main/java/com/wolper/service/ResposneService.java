package com.wolper.service;

import model.CodeAndName;
import model.MapOfCountries;
import model.MapOfIndicators;
import model.MapOfTime;

import java.util.List;

public interface ResposneService {
    void replaceIndName(MapOfIndicators mapI, Multilang.SLANG slang);

    void replaceContNameIndName(MapOfTime mapC, Multilang.SLANG slang);

    void replaceContName(MapOfCountries mapC, Multilang.SLANG slang);

    String interfacer(Multilang o, Multilang.SLANG lang);

    Multilang.SLANG resolvLang(String lang);

    void replaceUnitName(List<?> start, Multilang.SLANG slang);

    void replaceASNames(Object start, Multilang.SLANG slang);

    <T extends Multilang> List<CodeAndName> allReplacedhelper(String lang, List<T> all);
}
