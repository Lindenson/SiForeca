package com.wolper.repositories;


import com.wolper.dto.ResetToken;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface TokenRepository extends CrudRepository<ResetToken, Long> {
    @Modifying
    @Query("delete from restoken where username = :name")
    void deleteByUsername(@Param("name")String name);
    ResetToken findByToken(String token);
    ResetToken findByUsername(String user);
}
