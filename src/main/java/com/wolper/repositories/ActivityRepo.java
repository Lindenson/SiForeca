package com.wolper.repositories;

import com.wolper.dto.Activity;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface ActivityRepo extends CrudRepository<Activity, Long> {
    List<Activity> findAll();
}
