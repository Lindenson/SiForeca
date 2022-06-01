package com.wolper.repositories;

import com.wolper.dto.Country;
import com.wolper.dto.Indicator;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface CountryRepo extends CrudRepository<Country, Long> {
    List<Country> findAll();
    Indicator findCountriesByCode(String code);
}
