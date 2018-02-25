<style scoped lang="scss">
  .gray-background {
    background-color: #f3f3f3;
    & /deep/ .card__media__background {
      padding: 4px;
      background-origin: content-box !important;
    }
  }
</style>


<template>
  <v-card>
    <v-card-media
      class="gray-background"
      :src="command.logo_url"
      contain
      height="108px"
    >
      <v-container fill-height class="pa-0">
        <v-layout fill-height align-end column class="pa-1">
          <v-btn flat icon color="warning"><v-icon>edit</v-icon></v-btn>
        </v-layout>
      </v-container>
    </v-card-media>

    <v-card-text>
      <h2 class="text-xs-center mb-2">{{ command.name }}</h2>
      <p class="grey--text text-xs-center mb-0">{{ command.registration_date }}</p>
    </v-card-text>

    <v-divider/>

    <v-list dense>
      <v-list-tile>
        <v-list-tile-content>Owner:</v-list-tile-content>
        <v-list-tile-content class="align-end">
          {{ command.owner }}
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-card>
</template>


<script>
  export default {
    name: 'CommandCard',
    props: ['command'],
  }
</script>
