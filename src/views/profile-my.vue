<template>
  <div>
    <h2 class="content-block">Profile</h2>

    <div class="content-block dx-card responsive-paddings">
      <div class="form-avatar">
        <img :src="imageSrc" />
      </div>
      <span>{{ formData.Notes }}</span>
    </div>

    <div class="content-block dx-card responsive-paddings">
      <dx-form
          id="form"
          label-location="top"
          :form-data="formData"
          :colCountByScreen="colCountByScreen"
      />
    </div>
  </div>
</template>

<script>
import DxForm from "devextreme-vue/form";

export default {
  props: {
    picture: String
  },
  data() {
    const picture = "https://publons.com/media/thumbs/academic/photos/f6f6f42f-4f04-4855-bec3-a3781761b2d8.png.200x200_q95_crop_detail_upscale.png";
    return {
      imageSrc: picture,
      formData: {
        ID: 7,
        FirstName: "Valentin",
        LastName: "Vishnevsky",
        Prefix: "Mr.",
        Position: "Leader",
        Picture: picture,
        BirthDate: new Date("1958/06/8"),
        Notes:
        "Valentine Pavlovich Vishnevsky (born June 8, 1958) is a Ukrainian economist. Fellow of the National Academy of Sciences of Ukraine (2012) and professor of economics (2005). The area of his scientific interests includes economic theory, modelling of economic systems, fiscal, monetary and industrial policy. ",
        Address: "Ukraine"
      },
      colCountByScreen: {
        xs: 1,
        sm: 2,
        md: 3,
        lg: 4
      }
    };
  },
  components: {
    DxForm
  }
};
</script>

<style lang="scss">
.form-avatar {
  float: left;
  height: 120px;
  width: 120px;
  margin-right: 20px;
  border: 1px solid rgba(0, 0, 0, 0.1);
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
  background-color: #fff;
  overflow: hidden;

  img {
    height: 120px;
    display: block;
    margin: 0 auto;
  }
}
</style>





<style lang="scss">

</style>
