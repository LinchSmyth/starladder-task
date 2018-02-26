<style scoped lang="scss">
  .blurred /deep/ .parallax__image-container {
    img {
      filter: blur(2px);
    }
  }

  .sliced-border {
    position: relative;
    &::before {
      position: absolute;
      content: '';
      height: 80px;
      width: 100%;
      top: -40px;
      background-color: #FAFAFA;
      transform: skew(0deg, 3deg);
    }
  }
</style>


<template>
<v-main no-container>

  <v-parallax
    class="blurred"
    height="400"
    src="http://www.apu.edu.my/sites/default/files/dota2.jpeg"
  >
    <v-layout column align-center justify-center>
      <h1 class="white--text mb-5">DOTA2 tournaments qualification started</h1>
    </v-layout>
  </v-parallax>

  <v-layout column wrap align-center class="py-5 sliced-border">
    <v-flex xs12 sm4 class="my-3">
      <div class="text-xs-center">
        <h2 class="headline">Register your team now!</h2>
        <span class="subheading">
          with official StarLadder oauth
        </span>
      </div>
    </v-flex>
    <v-flex xs12>
      <v-container grid-list-xl>
        <v-layout row wrap align-center>
          <v-flex xs12 md4>
            <v-card class="elevation-0 transparent">
              <v-card-text class="text-xs-center">
                <v-icon x-large class="blue--text text--lighten-2">color_lens</v-icon>
              </v-card-text>
              <v-card-title primary-title class="layout justify-center">
                <div class="headline text-xs-center">Lorem ipsum</div>
              </v-card-title>
              <v-card-text>
                Cras facilisis mi vitae nunc lobortis pharetra. Nulla volutpat tincidunt ornare.
                Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                Nullam in aliquet odio. Aliquam eu est vitae tellus bibendum tincidunt. Suspendisse potenti.
              </v-card-text>
            </v-card>
          </v-flex>
          <v-flex xs12 md4>
            <v-card class="elevation-0 transparent">
              <v-card-text class="text-xs-center">
                <v-icon x-large class="blue--text text--lighten-2">flash_on</v-icon>
              </v-card-text>
              <v-card-title primary-title class="layout justify-center">
                <div class="headline">Lorem ipsum</div>
              </v-card-title>
              <v-card-text>
                Cras facilisis mi vitae nunc lobortis pharetra. Nulla volutpat tincidunt ornare.
                Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                Nullam in aliquet odio. Aliquam eu est vitae tellus bibendum tincidunt. Suspendisse potenti.
              </v-card-text>
            </v-card>
          </v-flex>
          <v-flex xs12 md4>
            <v-card class="elevation-0 transparent">
              <v-card-text class="text-xs-center">
                <v-icon x-large class="blue--text text--lighten-2">build</v-icon>
              </v-card-text>
              <v-card-title primary-title class="layout justify-center">
                <div class="headline text-xs-center">Lorem ipsum</div>
              </v-card-title>
              <v-card-text>
                Cras facilisis mi vitae nunc lobortis pharetra. Nulla volutpat tincidunt ornare.
                Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                Nullam in aliquet odio. Aliquam eu est vitae tellus bibendum tincidunt. Suspendisse potenti.
              </v-card-text>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-flex>
  </v-layout>

</v-main>
</template>


<script>
  export default {
    name: 'Home',
    data() {
      return {
        smthing: 'Hello!'
      }
    }
  }
</script>
