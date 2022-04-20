<template>
  <div>
    <h2 class="content-block">GDP is not a target..</h2>
    <div class="content-block">

        <DxChart
        id="chart"
        :rotated="true"
        data-source="https://js.devexpress.com/Demos/WidgetsGallery/JSDemos/data/simpleJSON.json"
        title="In comparison"
        >

        <DxArgumentAxis>
          <DxLabel :customize-text="customizeLabelText"/>
        </DxArgumentAxis>

        <DxValueAxis>
          <DxTick :visible="false"/>
          <DxLabel :visible="false"/>
        </DxValueAxis>

        <DxSeries
            argument-field="day"
            value-field="sales"
            type="bar"
            color="#79cac4"
        >
          <DxLabel
              :visible="true"
              background-color="#c18e92"
          />
        </DxSeries>

        <DxLegend :visible="false"/>

        <DxExport :enabled="false"/>

      </DxChart>
    </div>
  </div>
</template>


<script>
import DxChart, {
  DxArgumentAxis,
  DxExport,
  DxSeries,
  DxValueAxis,
  DxLabel,
  DxLegend,
  DxTick,
} from 'devextreme-vue/chart';

export default {
  components: {
    DxChart,
    DxArgumentAxis,
    DxExport,
    DxSeries,
    DxValueAxis,
    DxLabel,
    DxLegend,
    DxTick,
  },
  methods: {
    customizeLabelText({ valueText }) {
      return `Day ${valueText}`;
    },
  },
};
</script>
<style>
#chart {
  height: 440px;
}
</style>