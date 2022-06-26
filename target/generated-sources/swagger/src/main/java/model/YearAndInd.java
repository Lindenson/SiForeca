package model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.v3.oas.annotations.media.Schema;
import java.math.BigDecimal;
import org.springframework.validation.annotation.Validated;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * Year plus Indicator
 */
@Schema(description = "Year plus Indicator")
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.v3.generators.java.SpringCodegen", date = "2022-06-25T20:50:01.785971770+02:00[Europe/Bratislava]")


public class YearAndInd   {
  @JsonProperty("year")
  private Integer year = null;

  @JsonProperty("indicator")
  private BigDecimal indicator = null;

  @JsonProperty("branch")
  private String branch = null;

  @JsonProperty("unit")
  private String unit = null;

  public YearAndInd year(Integer year) {
    this.year = year;
    return this;
  }

  /**
   * Year
   * @return year
   **/
  @Schema(description = "Year")
  
    public Integer getYear() {
    return year;
  }

  public void setYear(Integer year) {
    this.year = year;
  }

  public YearAndInd indicator(BigDecimal indicator) {
    this.indicator = indicator;
    return this;
  }

  /**
   * Indicator
   * @return indicator
   **/
  @Schema(description = "Indicator")
  
    @Valid
    public BigDecimal getIndicator() {
    return indicator;
  }

  public void setIndicator(BigDecimal indicator) {
    this.indicator = indicator;
  }

  public YearAndInd branch(String branch) {
    this.branch = branch;
    return this;
  }

  /**
   * Branch
   * @return branch
   **/
  @Schema(description = "Branch")
  
    public String getBranch() {
    return branch;
  }

  public void setBranch(String branch) {
    this.branch = branch;
  }

  public YearAndInd unit(String unit) {
    this.unit = unit;
    return this;
  }

  /**
   * Unit
   * @return unit
   **/
  @Schema(description = "Unit")
  
    public String getUnit() {
    return unit;
  }

  public void setUnit(String unit) {
    this.unit = unit;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    YearAndInd yearAndInd = (YearAndInd) o;
    return Objects.equals(this.year, yearAndInd.year) &&
        Objects.equals(this.indicator, yearAndInd.indicator) &&
        Objects.equals(this.branch, yearAndInd.branch) &&
        Objects.equals(this.unit, yearAndInd.unit);
  }

  @Override
  public int hashCode() {
    return Objects.hash(year, indicator, branch, unit);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class YearAndInd {\n");
    
    sb.append("    year: ").append(toIndentedString(year)).append("\n");
    sb.append("    indicator: ").append(toIndentedString(indicator)).append("\n");
    sb.append("    branch: ").append(toIndentedString(branch)).append("\n");
    sb.append("    unit: ").append(toIndentedString(unit)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(java.lang.Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }
}
