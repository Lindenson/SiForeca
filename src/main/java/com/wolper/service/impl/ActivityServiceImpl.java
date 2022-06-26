package com.wolper.service.impl;

import com.wolper.dto.Activity;
import com.wolper.repositories.ActivityRepo;
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
public class ActivityServiceImpl implements com.wolper.service.ActivityService {

    private final ActivityRepo activityRepo;
    private final ResposneService resposneService;

    @Override
    public List<String> getActivityNames(){
        return activityRepo.findAll().stream().map(Activity::getCode).collect(Collectors.toList());
    }

    @Override
    public List<CodeAndName> findAllReplaced(String lang){
        List<CodeAndName> resL = new ArrayList<>();
        try {
            List<Activity> all = activityRepo.findAll();
            resL=resposneService.allReplacedHelper(lang, all);
        }
        catch (Exception ex) {
            log.error(ex.getMessage());
        }
        return resL;
    }

}
