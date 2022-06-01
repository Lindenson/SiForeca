package com.wolper.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("authorities")
@Data
@AllArgsConstructor
public class AppUserRole {
    @Id
    private long id;
    private String username;
    private String authority;
}