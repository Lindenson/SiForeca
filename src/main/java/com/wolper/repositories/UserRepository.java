package com.wolper.repositories;

import com.wolper.dto.AppUser;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends CrudRepository<AppUser, Long> {
    AppUser findDistinctByUsername(String user);
    boolean existsByUsername(String user);
    @Modifying
    @Query("delete from users u where u.username = :name")
    void deleteByUsername(@Param("name")String name);
    @Modifying
    @Query("update users set enabled = 1 where username = :name")
    void setUserEnanbedByName(@Param("name")String name);
}
