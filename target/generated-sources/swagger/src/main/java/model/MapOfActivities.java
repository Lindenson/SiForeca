package model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.v3.oas.annotations.media.Schema;
import java.util.ArrayList;
import java.util.List;
import model.MapOfActivitiesSectors;
import org.springframework.validation.annotation.Validated;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * Activities mapped to sector
 */
@Schema(description = "Activities mapped to sector")
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.v3.generators.java.SpringCodegen", date = "2022-06-25T20:50:01.785971770+02:00[Europe/Bratislava]")


public class MapOfActivities   {
  @JsonProperty("indicator")
  private String indicator = null;

  @JsonProperty("sectors")
  @Valid
  private List<MapOfActivitiesSectors> sectors = null;

  public MapOfActivities indicator(String indicator) {
    this.indicator = indicator;
    return this;
  }

  /**
   * Get indicator
   * @return indicator
   **/
  @Schema(description = "")
  
    public String getIndicator() {
    return indicator;
  }

  public void setIndicator(String indicator) {
    this.indicator = indicator;
  }

  public MapOfActivities sectors(List<MapOfActivitiesSectors> sectors) {
    this.sectors = sectors;
    return this;
  }

  public MapOfActivities addSectorsItem(MapOfActivitiesSectors sectorsItem) {
    if (this.sectors == null) {
      this.sectors = new ArrayList<MapOfActivitiesSectors>();
    }
    this.sectors.add(sectorsItem);
    return this;
  }

  /**
   * Sector
   * @return sectors
   **/
  @Schema(description = "Sector")
      @Valid
    public List<MapOfActivitiesSectors> getSectors() {
    return sectors;
  }

  public void setSectors(List<MapOfActivitiesSectors> sectors) {
    this.sectors = sectors;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    MapOfActivities mapOfActivities = (MapOfActivities) o;
    return Objects.equals(this.indicator, mapOfActivities.indicator) &&
        Objects.equals(this.sectors, mapOfActivities.sectors);
  }

  @Override
  public int hashCode() {
    return Objects.hash(indicator, sectors);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class MapOfActivities {\n");
    
    sb.append("    indicator: ").append(toIndentedString(indicator)).append("\n");
    sb.append("    sectors: ").append(toIndentedString(sectors)).append("\n");
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
