package com.wolper.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;
import java.time.LocalDateTime;

@Table("restoken")
@Data
@AllArgsConstructor
public class ResetToken {
    @Id
    private long id;
    private String token;
    private String username;
    private LocalDateTime expiredate;
    private String password;
}