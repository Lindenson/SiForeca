package com.wolper.service.impl;

import com.wolper.dto.Country;
import com.wolper.repositories.CountryRepo;
import com.wolper.service.ResposneService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import model.CodeAndName;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@AllArgsConstructor
public class CountryServiceImpl implements com.wolper.service.CountryService {

    private final CountryRepo country;
    private final ResposneService resposneService;

    @Override
    public List<String> getCountryNames(){
        return country.findAll().stream().map(Country::getCode).collect(Collectors.toList());
    }


    @Override
    public List<CodeAndName> findAllReplaced(String lang){
        List<CodeAndName> resL = new ArrayList<>();
        try {
            List<Country> all = country.findAll();
            resL=resposneService.allReplacedhelper(lang, all);
        }
        catch (Exception ex) {
            log.error(ex.getMessage());
        }
        return resL;
    }
}
