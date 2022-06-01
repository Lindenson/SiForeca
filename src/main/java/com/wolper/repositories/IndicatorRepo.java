package com.wolper.repositories;


import com.wolper.dto.Indicator;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface IndicatorRepo extends CrudRepository<Indicator, Long> {
       List<Indicator> findAll();
       Indicator findIndicatorByCode(String code);
}
