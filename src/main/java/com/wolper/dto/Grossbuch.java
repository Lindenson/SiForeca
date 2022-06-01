package com.wolper.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.math.BigDecimal;
import java.time.LocalDate;


@Data
@Table("grossbuch")
@AllArgsConstructor
public class Grossbuch {
    @Id
    Long id;
    LocalDate date;
    BigDecimal data;
    String unit;
    String period;
    String branch;
    String country;
    String activity;
    String source;
    String sector;
    String indicator;
    String industry;
    String base;
    String wbname;
}
