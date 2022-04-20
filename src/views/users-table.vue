<template>
  <div class="content-block">
    <h2>Who is useless person?</h2>
    <DxDataGrid
        id="gridContainer"
        :data-source="dataSource"
        :allow-column-reordering="true"
        :show-borders="true"
        key-expr="ID"
    >
      <DxSearchPanel :visible="true" />
      <DxPaging :enabled="true"/>
      <DxEditing
          :allow-updating="true"
          :allow-deleting="true"
          :allow-adding="true"
          mode="row"
      />
      <DxScrolling/>

      <DxColumn
          minWidth="70"
          data-field="Prefix"
          caption="Title"
      />
      <DxColumn
          minWidth="70"
          data-field="FirstName"
      />

      <DxColumn
          minWidth="70"
          data-field="LastName"
      />
      <DxColumn
          :width="130"
          data-field="Position"
      />
      <DxColumn
          :width="125"
          data-field="StateID"
          caption="State"
      >
        <DxLookup
            :data-source="states"
            display-expr="Name"
            value-expr="ID"
        />
      </DxColumn>
      <DxColumn
          :width="125"
          data-field="BirthDate"
          data-type="date"
      />
    </DxDataGrid>
 </div>
</template>
<script>

import {
  DxDataGrid, DxColumn, DxEditing, DxPaging, DxLookup, DxSearchPanel,
} from 'devextreme-vue/data-grid';
import { employees, states } from '../data/data4.js';

export default {
  components: {
    DxDataGrid,
    DxColumn,
    DxEditing,
    DxPaging,
    DxLookup,
    DxSearchPanel
  },
  data() {
    return {
      dataSource: employees,
      states,
    };
  },
  methods: {
  },
};
</script>
<style>

</style>
