package com.wolper.service.impl;

import com.wolper.dto.Sector;
import com.wolper.repositories.SectorRepo;
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
public class SectorServiceImpl {

    public final SectorRepo sectorRepo;
    public final ResposneServiceImpl resposneService;

    public List<String> getSectorNames(){
        return sectorRepo.findAll().stream().map(Sector::getCode).collect(Collectors.toList());
    }


    public List<CodeAndName> findAllReplaced(String lang){
        List<CodeAndName> resL = new ArrayList<>();
        try {
            List<Sector> all = sectorRepo.findAll();
            resL=resposneService.allReplacedhelper(lang, all);
        }
        catch (Exception ex) {
            log.error(ex.getMessage());
        }
        return resL;
    }
}
