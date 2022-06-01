package com.wolper.repositories;

import com.wolper.dto.UserBlocked;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


/**
 * SpringData CrudRepository for Redis
 * Contains Users blocked after their logging-out.
 * Users are expired from the DB automatically.
 * The expiration is set up in {@link UserBlocked}
 */
@Repository
public interface UserBlockList extends CrudRepository<UserBlocked, String> {}

