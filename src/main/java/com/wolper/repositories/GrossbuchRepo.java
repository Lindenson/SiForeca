package com.wolper.repositories;

import com.wolper.dto.Grossbuch;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import java.util.List;


public interface GrossbuchRepo extends CrudRepository<Grossbuch, Long> {
    List<Grossbuch> findAll();

    @Query("select distinct date_part('year',date) as d from grossbuch order by d")
    List<Integer> findAllYears();

    List<Grossbuch> findAllByCountryAndSectorAndActivity(String country, String sector, String activity);

    List<Grossbuch> findAllByIndicatorAndSectorAndActivity(String indicator, String sector, String activity);

    @Query("select * from grossbuch where date_part('year',date) = :year and sector = :sector and activity = :activity")
    List<Grossbuch> findAllByDateYear(@Param("year") Integer year, @Param("sector") String sector, @Param("activity") String activity);

    @Query("SELECT DISTINCT ON (indicator, sector, activity) * FROM grossbuch;")
    List<Grossbuch> findAllIndicatorsGroupedBySectorAndActivity();

    @Query("SELECT DISTINCT ON (country, sector, activity) * FROM grossbuch;")
    List<Grossbuch> findAllCountriesGroupedBySectorAndActivity();

    @Query("SELECT DISTINCT ON (date_part('year',date), sector, activity) * FROM grossbuch;")
    List<Grossbuch> findAllYearsGroupedBySectorAndActivity();
}
