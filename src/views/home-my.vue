<template>
  <div class="content-block">
    <h2>Dashboard</h2>
    <div class="container-fluid">
      <div class="row">
        <div class="col-xl-4 col-md-6 forgra justify-content-center">
          <graph-my :ref="helper1"/>
        </div>
        <div class="col-xl-4 col-md-6 forgra justify-content-center">
          <gauge-my :ref="helper0"/>
        </div>
        <div class="col-xl-4 col-md-6 forgra justify-content-center">
          <chart-my :ref="helper2"/>
        </div>
      </div>
      <div class="row">
        <div class="col-xl-4 col-md-6 forgra justify-content-center">
          <chart-my :ref="helper22"/>
        </div>
        <div class="col-xl-4 col-md-6 forgra justify-content-center">
          <graph-my :ref="helper11"/>
        </div>
        <div class="col-xl-4 col-md-6 forgra justify-content-center">
          <gauge-my :ref="helper00"/>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
const helper0 = "helper0";
const helper00 = "helper00";
const helper1 = "helper1";
const helper11 = "helper11";
const helper2 = "helper2";
const helper22 = "helper22";

import 'devextreme/dist/css/dx.light.css';
import 'bootstrap/dist/css/bootstrap.css'
import notify from 'devextreme/ui/notify';
import GraphMy from "@/components/graph-my.vue"
import ChartMy from "@/components/chart-my.vue"
import GaugeMy from "@/components/gauge-my.vue"

export default {
  components: {
    GaugeMy,
    ChartMy,
    GraphMy,
  },
  data() {
    return {
      helper0,
      helper00,
      helper1,
      helper11,
      helper2,
      helper22,
      message: null,
    };
  },
  mounted () {
    document.cm0=this.cm0;
    this.message=this.$route.params.message;
    this.noty();
  },
  computed: {
    cm0: function() {
      return [this.$refs[helper0].$refs['ch-ch00'].instance,
              this.$refs[helper00].$refs['ch-ch00'].instance,
              this.$refs[helper1].$refs['ch-ch11'].instance,
              this.$refs[helper11].$refs['ch-ch11'].instance,
              this.$refs[helper2].$refs['ch-ch22'].instance,
              this.$refs[helper22].$refs['ch-ch22'].instance]
    }
  },
  methods: {
    noty: function () {
      if (this.message) {
        let text = this.message.substr(this.message.indexOf("=") + 1);
        this.message=null;
        setTimeout(function () {
          notify(text, 'success', 2500);
        }, 2000);
      }
    }
  }
};

</script>

<style>
   .container {
     margin: 0 auto!important;
     padding: 0px !important;
     max-width: 4000px !important;
   }


   .forgra {
      align: center !important;
      text-align: center !important;
      padding: 4px !important;
   }

   .forgra > * {
     align: center !important;
     text-align: center !important;
     border-style: solid;
     border-width: 1px;
     border-color: #666666;
   }

</style>
