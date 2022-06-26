package model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.v3.oas.annotations.media.Schema;
import java.util.ArrayList;
import java.util.List;
import org.springframework.validation.annotation.Validated;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * MapOfActivitiesSectors
 */
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.v3.generators.java.SpringCodegen", date = "2022-06-25T20:50:01.785971770+02:00[Europe/Bratislava]")


public class MapOfActivitiesSectors   {
  @JsonProperty("sname")
  private String sname = null;

  @JsonProperty("activities")
  @Valid
  private List<String> activities = null;

  public MapOfActivitiesSectors sname(String sname) {
    this.sname = sname;
    return this;
  }

  /**
   * Get sname
   * @return sname
   **/
  @Schema(description = "")
  
    public String getSname() {
    return sname;
  }

  public void setSname(String sname) {
    this.sname = sname;
  }

  public MapOfActivitiesSectors activities(List<String> activities) {
    this.activities = activities;
    return this;
  }

  public MapOfActivitiesSectors addActivitiesItem(String activitiesItem) {
    if (this.activities == null) {
      this.activities = new ArrayList<String>();
    }
    this.activities.add(activitiesItem);
    return this;
  }

  /**
   * Get activities
   * @return activities
   **/
  @Schema(description = "")
  
    public List<String> getActivities() {
    return activities;
  }

  public void setActivities(List<String> activities) {
    this.activities = activities;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    MapOfActivitiesSectors mapOfActivitiesSectors = (MapOfActivitiesSectors) o;
    return Objects.equals(this.sname, mapOfActivitiesSectors.sname) &&
        Objects.equals(this.activities, mapOfActivitiesSectors.activities);
  }

  @Override
  public int hashCode() {
    return Objects.hash(sname, activities);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class MapOfActivitiesSectors {\n");
    
    sb.append("    sname: ").append(toIndentedString(sname)).append("\n");
    sb.append("    activities: ").append(toIndentedString(activities)).append("\n");
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
