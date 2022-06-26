package model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.v3.oas.annotations.media.Schema;
import java.util.ArrayList;
import java.util.List;
import model.DataAndInd;
import org.springframework.validation.annotation.Validated;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * Indicator for selected year
 */
@Schema(description = "Indicator for selected year")
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.v3.generators.java.SpringCodegen", date = "2022-06-26T20:34:21.785972722+02:00[Europe/Bratislava]")


public class MapOfTimeInner   {
  @JsonProperty("cname")
  private String cname = null;

  @JsonProperty("sname")
  private String sname = null;

  @JsonProperty("aname")
  private String aname = null;

  @JsonProperty("cdata")
  @Valid
  private List<DataAndInd> cdata = null;

  public MapOfTimeInner cname(String cname) {
    this.cname = cname;
    return this;
  }

  /**
   * Country name
   * @return cname
   **/
  @Schema(description = "Country name")
  
    public String getCname() {
    return cname;
  }

  public void setCname(String cname) {
    this.cname = cname;
  }

  public MapOfTimeInner sname(String sname) {
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

  public MapOfTimeInner aname(String aname) {
    this.aname = aname;
    return this;
  }

  /**
   * Actibity name
   * @return aname
   **/
  @Schema(description = "Actibity name")
  
    public String getAname() {
    return aname;
  }

  public void setAname(String aname) {
    this.aname = aname;
  }

  public MapOfTimeInner cdata(List<DataAndInd> cdata) {
    this.cdata = cdata;
    return this;
  }

  public MapOfTimeInner addCdataItem(DataAndInd cdataItem) {
    if (this.cdata == null) {
      this.cdata = new ArrayList<DataAndInd>();
    }
    this.cdata.add(cdataItem);
    return this;
  }

  /**
   * Data matrix
   * @return cdata
   **/
  @Schema(description = "Data matrix")
      @Valid
    public List<DataAndInd> getCdata() {
    return cdata;
  }

  public void setCdata(List<DataAndInd> cdata) {
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
    MapOfTimeInner mapOfTimeInner = (MapOfTimeInner) o;
    return Objects.equals(this.cname, mapOfTimeInner.cname) &&
        Objects.equals(this.sname, mapOfTimeInner.sname) &&
        Objects.equals(this.aname, mapOfTimeInner.aname) &&
        Objects.equals(this.cdata, mapOfTimeInner.cdata);
  }

  @Override
  public int hashCode() {
    return Objects.hash(cname, sname, aname, cdata);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class MapOfTimeInner {\n");
    
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
