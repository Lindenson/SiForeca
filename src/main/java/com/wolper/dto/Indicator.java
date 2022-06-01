package com.wolper.dto;


import com.wolper.service.Multilang;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Data
@Table("indicator")
@AllArgsConstructor
public class Indicator implements Multilang {
    @Id
    Long id;
    String code;
    String ename;
    String uname;
    String rname;
}