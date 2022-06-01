package com.wolper.repositories;

import com.wolper.dto.AppUserRole;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;


public interface AuthRepository extends CrudRepository<AppUserRole, Long> {
    AppUserRole findDistinctByUsername(String user);

    @Modifying
    @Query("delete from authorities u where u.username = :name")
    void deleteByUsername(@Param("name")String name);
}
