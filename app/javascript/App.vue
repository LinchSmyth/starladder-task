<style lang="scss">
  @import 'vuetify/dist/vuetify.min.css';

  main {
    padding-top: 64px;
  }
</style>

<template>
<v-app>

  <v-toolbar color="indigo" dark fixed app>
    <v-toolbar-title>StarLadder</v-toolbar-title>

    <v-toolbar-items>
      <v-btn flat>
        tournaments
      </v-btn>
    </v-toolbar-items>

    <v-spacer/>

    <v-toolbar-items>
      <v-btn flat>
        login
      </v-btn>
    </v-toolbar-items>
  </v-toolbar>

  <main>
    <v-container>
      <router-view></router-view>
    </v-container>
  </main>

</v-app>
</template>

<script>
  import Vue         from 'vue'
  import VueResource from 'vue-resource'
  import Vuetify     from 'vuetify'

  Vue.use(VueResource)
  Vue.use(Vuetify)

//  Vue.http.interceptors.push(function(request, next) {
//    request.headers.set('Authorization', `Bearer ${localStorage.getItem('token')}`);
//    next();
//  });

  export default {
    name: 'App'
  }
</script>
