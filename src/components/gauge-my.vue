<template>
      <DxBarGauge
          id="gauge"
          :start-value="0"
          :end-value="100"
          :values="values"
          :ref="ch00"
      >
        <DxLabel
            :indent="30"
            :format="format"
            :customize-text="customizeText"
        />
        <DxExport
            :enabled="false"
        />
        <DxTitle
            text="Inflation"
        >
          <DxFont
              :size="22"
          />
        </DxTitle>
      </DxBarGauge>
</template>

<script>


const ch00 = "ch-ch00";

import {
  DxBarGauge, DxLabel, DxExport, DxTitle, DxFont,
} from 'devextreme-vue/bar-gauge';

export default {
  components: {
    DxBarGauge, DxLabel, DxExport, DxTitle, DxFont,
  },
  data() {
    return {
      values: [47.27, 65.32, 84.59, 71.86],
      format: {
        type: 'fixedPoint',
        precision: 1,
      },
      ch00
    };
  },
  methods: {
    customizeText({ valueText }) {
      return `${valueText} %`;
    },
  },
};
</script>
<style>
#gauge {
  margin: 0 auto!important;
  height: 100% !important;
  padding: 2% !important;
}
</style>

