package com.wolper.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.redis.core.RedisHash;


@Data
@RedisHash(value = "UB", timeToLive = 60*60*24)
@NoArgsConstructor
@AllArgsConstructor
@TypeAlias("UB")
public class UserBlocked {
    @Id
    private String un;
}
