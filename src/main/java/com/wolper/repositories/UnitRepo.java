package com.wolper.repositories;

import com.wolper.dto.Unit;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface UnitRepo extends CrudRepository<Unit, Long> {
    List<Unit> findAll();
    Unit findCountriesByCode(String code);

}
