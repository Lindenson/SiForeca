package com.wolper.repositories;

import com.wolper.dto.IPBlocked;
import org.springframework.data.repository.CrudRepository;

public interface IPblockList extends CrudRepository<IPBlocked, String> {}

