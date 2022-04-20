<template>
  <DxPieChart
      id="pie"
      :data-source="areas"
      palette="Bright"
      title="Population"
      @point-click="pointClickHandler($event)"
      @legend-click="legendClickHandler($event)"
      :ref="ch22"
  >
    <DxSeries
        argument-field="country"
        value-field="area"
    >
      <DxLabel :visible="true">
        <DxConnector
            :visible="true"
            :width="1"
        />
      </DxLabel>
    </DxSeries>
    <DxSize/>
    <DxExport :enabled="false"/>
  </DxPieChart>
</template>

<script>

import DxPieChart, {
  DxSize,
  DxSeries,
  DxLabel,
  DxConnector,
  DxExport,
} from 'devextreme-vue/pie-chart';

import { areas } from '../data/data1';

const ch22 = "ch-ch22";

export default {
  components: {
    DxPieChart,
    DxSize,
    DxSeries,
    DxLabel,
    DxConnector,
    DxExport,
  },
  data() {
    return {
      areas,
      ch22,
    };
  },
  methods: {
    pointClickHandler(e) {
      this.toggleVisibility(e.target);
    },
    legendClickHandler(e) {
      const arg = e.target;
      const item = e.component.getAllSeries()[0].getPointsByArg(arg)[0];

      this.toggleVisibility(item);
    },
    toggleVisibility(item) {
      item.isVisible() ? item.hide() : item.show();
    },
  },
};
</script>

<style>

#pie {
  margin: 0 auto!important;
  height: 100% !important;
  padding: 2% !important;
}
</style>
