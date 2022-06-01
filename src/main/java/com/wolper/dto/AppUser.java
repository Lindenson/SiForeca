package com.wolper.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("users")
@Data
@AllArgsConstructor
public class AppUser {
    @Id
    private long id;
    private String username;
    private String password;
    private int enabled;
}