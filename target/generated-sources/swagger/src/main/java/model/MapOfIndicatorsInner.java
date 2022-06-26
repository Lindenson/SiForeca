package model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.v3.oas.annotations.media.Schema;
import java.util.ArrayList;
import java.util.List;
import model.YearAndInd;
import org.springframework.validation.annotation.Validated;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * Indicator for selected country
 */
@Schema(description = "Indicator for selected country")
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.v3.generators.java.SpringCodegen", date = "2022-06-25T20:50:01.785971770+02:00[Europe/Bratislava]")


public class MapOfIndicatorsInner   {
  @JsonProperty("iname")
  private String iname = null;

  @JsonProperty("sname")
  private String sname = null;

  @JsonProperty("aname")
  private String aname = null;

  @JsonProperty("idata")
  @Valid
  private List<YearAndInd> idata = null;

  public MapOfIndicatorsInner iname(String iname) {
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

  public MapOfIndicatorsInner sname(String sname) {
    this.sname = sname;
    return this;
  }

  /**
   * Sector name
   * @return sname
   **/
  @Schema(description = "Sector name")
  
    public String getSname() {
    return sname;
  }

  public void setSname(String sname) {
    this.sname = sname;
  }

  public MapOfIndicatorsInner aname(String aname) {
    this.aname = aname;
    return this;
  }

  /**
   * Activity name
   * @return aname
   **/
  @Schema(description = "Activity name")
  
    public String getAname() {
    return aname;
  }

  public void setAname(String aname) {
    this.aname = aname;
  }

  public MapOfIndicatorsInner idata(List<YearAndInd> idata) {
    this.idata = idata;
    return this;
  }

  public MapOfIndicatorsInner addIdataItem(YearAndInd idataItem) {
    if (this.idata == null) {
      this.idata = new ArrayList<YearAndInd>();
    }
    this.idata.add(idataItem);
    return this;
  }

  /**
   * Time series
   * @return idata
   **/
  @Schema(description = "Time series")
      @Valid
    public List<YearAndInd> getIdata() {
    return idata;
  }

  public void setIdata(List<YearAndInd> idata) {
    this.idata = idata;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    MapOfIndicatorsInner mapOfIndicatorsInner = (MapOfIndicatorsInner) o;
    return Objects.equals(this.iname, mapOfIndicatorsInner.iname) &&
        Objects.equals(this.sname, mapOfIndicatorsInner.sname) &&
        Objects.equals(this.aname, mapOfIndicatorsInner.aname) &&
        Objects.equals(this.idata, mapOfIndicatorsInner.idata);
  }

  @Override
  public int hashCode() {
    return Objects.hash(iname, sname, aname, idata);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class MapOfIndicatorsInner {\n");
    
    sb.append("    iname: ").append(toIndentedString(iname)).append("\n");
    sb.append("    sname: ").append(toIndentedString(sname)).append("\n");
    sb.append("    aname: ").append(toIndentedString(aname)).append("\n");
    sb.append("    idata: ").append(toIndentedString(idata)).append("\n");
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
