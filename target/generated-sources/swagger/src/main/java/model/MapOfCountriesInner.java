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
 * Country for selected indicator
 */
@Schema(description = "Country for selected indicator")
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.v3.generators.java.SpringCodegen", date = "2022-06-25T20:50:01.785971770+02:00[Europe/Bratislava]")


public class MapOfCountriesInner   {
  @JsonProperty("cname")
  private String cname = null;

  @JsonProperty("sname")
  private String sname = null;

  @JsonProperty("aname")
  private String aname = null;

  @JsonProperty("cdata")
  @Valid
  private List<YearAndInd> cdata = null;

  public MapOfCountriesInner cname(String cname) {
    this.cname = cname;
    return this;
  }

  /**
   * Country's name
   * @return cname
   **/
  @Schema(description = "Country's name")
  
    public String getCname() {
    return cname;
  }

  public void setCname(String cname) {
    this.cname = cname;
  }

  public MapOfCountriesInner sname(String sname) {
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

  public MapOfCountriesInner aname(String aname) {
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

  public MapOfCountriesInner cdata(List<YearAndInd> cdata) {
    this.cdata = cdata;
    return this;
  }

  public MapOfCountriesInner addCdataItem(YearAndInd cdataItem) {
    if (this.cdata == null) {
      this.cdata = new ArrayList<YearAndInd>();
    }
    this.cdata.add(cdataItem);
    return this;
  }

  /**
   * Time series
   * @return cdata
   **/
  @Schema(description = "Time series")
      @Valid
    public List<YearAndInd> getCdata() {
    return cdata;
  }

  public void setCdata(List<YearAndInd> cdata) {
    this.cdata = cdata;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    MapOfCountriesInner mapOfCountriesInner = (MapOfCountriesInner) o;
    return Objects.equals(this.cname, mapOfCountriesInner.cname) &&
        Objects.equals(this.sname, mapOfCountriesInner.sname) &&
        Objects.equals(this.aname, mapOfCountriesInner.aname) &&
        Objects.equals(this.cdata, mapOfCountriesInner.cdata);
  }

  @Override
  public int hashCode() {
    return Objects.hash(cname, sname, aname, cdata);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class MapOfCountriesInner {\n");
    
    sb.append("    cname: ").append(toIndentedString(cname)).append("\n");
    sb.append("    sname: ").append(toIndentedString(sname)).append("\n");
    sb.append("    aname: ").append(toIndentedString(aname)).append("\n");
    sb.append("    cdata: ").append(toIndentedString(cdata)).append("\n");
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
