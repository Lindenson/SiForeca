package com.wolper.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.redis.core.RedisHash;


@Data
@RedisHash(value = "IP", timeToLive = 60*60*24)
@NoArgsConstructor
@AllArgsConstructor
@TypeAlias("IP")
public class IPBlocked {
    @Id
    private String ip;
}
