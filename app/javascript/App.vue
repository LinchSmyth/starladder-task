<style lang="scss">
  @import 'vuetify/dist/vuetify.min.css';

  main {
    padding-top: 64px;
  }
</style>

<template>
<v-app>

  <v-toolbar color="indigo" dark fixed app>
    <v-spacer v-if="!showActions"/>

    <v-toolbar-title>StarLadder</v-toolbar-title>

    <v-toolbar-items v-if="showActions">
      <v-btn flat>
        tournaments
      </v-btn>
    </v-toolbar-items>

    <v-spacer/>

    <v-toolbar-items v-if="showActions">
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

  Vue.http.interceptors.push(function(request, next) {
    request.headers.set('Authorization', `Bearer ${localStorage.getItem('auth-token')}`);
    next();
  });

  export default {
    name: 'App',
    data() {
      return {
        showActions: true
      }
    },

    created() {
      window.eventBus.$on('toggle-actions', this.toggleActions)
    },

    methods: {
      toggleActions(displayable) {
        this.showActions = displayable
      },
    },
  }
</script>
