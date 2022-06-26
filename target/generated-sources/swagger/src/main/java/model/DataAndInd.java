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
 * Data plus Indicator
 */
@Schema(description = "Data plus Indicator")
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.v3.generators.java.SpringCodegen", date = "2022-06-26T20:34:21.785972722+02:00[Europe/Bratislava]")


public class DataAndInd   {
  @JsonProperty("iname")
  private String iname = null;

  @JsonProperty("indicator")
  private BigDecimal indicator = null;

  @JsonProperty("branch")
  private String branch = null;

  @JsonProperty("unit")
  private String unit = null;

  public DataAndInd iname(String iname) {
    this.iname = iname;
    return this;
  }

  /**
   * Indicator name
   * @return iname
   **/
  @Schema(description = "Indicator name")
  
    public String getIname() {
    return iname;
  }

  public void setIname(String iname) {
    this.iname = iname;
  }

  public DataAndInd indicator(BigDecimal indicator) {
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

  public DataAndInd branch(String branch) {
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

  public DataAndInd unit(String unit) {
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
    DataAndInd dataAndInd = (DataAndInd) o;
    return Objects.equals(this.iname, dataAndInd.iname) &&
        Objects.equals(this.indicator, dataAndInd.indicator) &&
        Objects.equals(this.branch, dataAndInd.branch) &&
        Objects.equals(this.unit, dataAndInd.unit);
  }

  @Override
  public int hashCode() {
    return Objects.hash(iname, indicator, branch, unit);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class DataAndInd {\n");
    
    sb.append("    iname: ").append(toIndentedString(iname)).append("\n");
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
