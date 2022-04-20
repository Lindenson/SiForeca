<template>
        <DxChart
            id="graph"
            :data-source="dataSource"
            palette="Harmony Light"
            title="Taxation"
            :ref="ch11"
        >
          <DxCommonSeriesSettings
              :type="type"
              argument-field="country"
          />
          <DxSeries
              value-field="y1564"
              name="15-64 years"
          />
          <DxSeries
              value-field="y014"
              name="0-14 years"
          />
          <DxSeries
              value-field="y65"
              name="65 years and older"
          />
          <DxMargin :bottom="20"/>
          <DxArgumentAxis :value-margins-enabled="false"/>
          <DxLegend
              vertical-alignment="bottom"
              horizontal-alignment="center"
          />
          <DxExport :enabled="false"/>
        </DxChart>
</template>


    <script>

      import {
        DxChart,
        DxSeries,
        DxArgumentAxis,
        DxCommonSeriesSettings,
        DxExport,
        DxLegend,
        DxMargin,
      } from 'devextreme-vue/chart';


      import { dataSource } from '../data/data2.js';

      const ch11 = "ch-ch11";

      export default {
        components: {
          DxChart,
          DxSeries,
          DxArgumentAxis,
          DxCommonSeriesSettings,
          DxExport,
          DxLegend,
          DxMargin,
        },
        data() {
          const types = ['area', 'stackedarea', 'fullstackedarea'];

          return {
            dataSource,
            types,
            type: types[0],
            ch11,
          };
        },
      };
    </script>
    <style>
      .options {
        padding: 20px;
        background-color: rgba(191, 191, 191, 0.15);
        margin-top: 20px;
      }

      .option {
        margin-top: 10px;
      }

      .caption {
        font-size: 14px;
        font-weight: 500;
      }

      .option > span {
        margin-right: 10px;
      }

      .option > .dx-widget {
        display: inline-block;
        vertical-align: middle;
      }

      #graph {
        margin: 0 auto!important;
        height: 100% !important;
        padding: 2% !important;
      }
    </style>
