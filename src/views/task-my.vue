<template>
  <div>
    <h2 class="content-block">Too many people..</h2>

    <DxVectorMap
        id="vector-map"
        :bounds="bounds">
      <DxLayer
          :data-source="mapsWorld"
          :color-groups="colorGroups"
          :customize="customizeLayer"
          name="areas"
          color-grouping-field="total"
      />
    </DxVectorMap>


  </div>
</template>




<script>

import * as mapsData from 'devextreme/dist/js/vectormap-data/world.js';

import {
  DxVectorMap,
  DxLayer,
} from 'devextreme-vue/vector-map';


export default {
  components: {
    DxVectorMap,
    DxLayer
  },
  data() {
    return {
      colorGroups: [0, 10000, 50000, 100000, 500000, 1000000, 10000000, 50000000],
      mapsWorld: mapsData.world,
      bounds: [-180, 85, 180, -60],
    };
  },
};


</script>
