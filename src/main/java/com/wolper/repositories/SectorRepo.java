package com.wolper.repositories;


import com.wolper.dto.Sector;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SectorRepo extends CrudRepository<Sector, Long> {
    List<Sector> findAll();
}
