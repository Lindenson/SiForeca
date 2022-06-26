package com.wolper.service.impl;

import com.wolper.dto.Indicator;
import com.wolper.repositories.IndicatorRepo;
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
public class IndicatorServiceImpl implements com.wolper.service.IndicatorService {

        private final IndicatorRepo indicator;
        private final ResposneService resposneService;

        @Override
        public List<String> getIndicatorNames(){
            return indicator.findAll().stream().map(Indicator::getCode).collect(Collectors.toList());
        }

    @Override
    public List<CodeAndName> findAllReplaced(String lang){
        List<CodeAndName> resL = new ArrayList<>();
        try {
            List<Indicator> all = indicator.findAll();
            resL=resposneService.allReplacedHelper(lang, all);
        }
        catch (Exception ex) {
            log.error(ex.getMessage());
        }
        return resL;
    }
}

