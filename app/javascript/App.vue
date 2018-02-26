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

    <v-toolbar-title class="px-3">StarLadder</v-toolbar-title>

    <v-toolbar-items v-if="showActions">
      <v-btn flat :to="{ name: 'TournamentsList' }">
        tournaments
      </v-btn>
    </v-toolbar-items>

    <v-spacer/>

    <v-toolbar-items v-if="showActions">
      <v-btn flat v-if="!userLogin" @click="login">
        login
      </v-btn>
      <v-btn flat v-else @click="logout">
        logout
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
        showActions: true,
        userLogin: false
      }
    },

    created() {
      window.eventBus.$on('toggle-actions', this.toggleActions)

      const originalSetItem = localStorage.setItem;
      const originalRemoveItem = localStorage.removeItem;

      localStorage.setItem = function() {
        const event = new Event('localStorageChange');
        originalSetItem.apply(this, arguments);
        document.dispatchEvent(event);
      }

      localStorage.removeItem = function() {
        const event = new Event('localStorageChange');
        originalRemoveItem.apply(this, arguments);
        document.dispatchEvent(event);
      }

      document.addEventListener(
        "localStorageChange",
        () => { this.handleLocalStorageChange() },
        false
      );

      this.handleLocalStorageChange()
    },

    methods: {
      login() {
        this.$router.push({ path: '/auth/starladder' })
        location.reload();
      },

      logout() {
        this.$http
            .get('/users/logout')
            .then(
              res => {
                localStorage.removeItem('auth-token')
                location.reload();
              },
              err => { console.log(err) }
            )
      },

      toggleActions(displayable) {
        this.showActions = displayable
      },

      handleLocalStorageChange() {
        this.userLogin = !!localStorage.getItem('auth-token')
      },
    },
  }
</script>
