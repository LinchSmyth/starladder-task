<style scoped lang="scss">
  .gray-background {
    background-color: #f3f3f3;
    & /deep/ .card__media__background {
      padding: 4px;
      background-origin: content-box !important;
      width: 100px;
      margin-left: calc(50% - 50px);
    }
  }
</style>


<template>
  <v-card>
    <v-card-media
      class="gray-background"
      :src="team.logo"
      contain
      height="108px"
    >
      <v-container fill-height class="pa-0">
        <v-layout fill-height align-end column class="pa-1">
          <v-btn
            flat
            icon
            color="warning"
            :to="{ name: 'EditTeam', params: { id: team.id } }"
            v-if="team.is_owner"
          >
            <v-icon>edit</v-icon>
          </v-btn>
        </v-layout>
      </v-container>
    </v-card-media>

    <v-card-text>
      <h2 class="text-xs-center mb-2">{{ team.name }}</h2>
      <p class="grey--text text-xs-center mb-0">{{ team.registration_date }}</p>
    </v-card-text>

    <v-divider/>

    <v-list dense>
      <v-list-tile>
        <v-list-tile-content>Owner:</v-list-tile-content>
        <v-list-tile-content class="align-end">
          {{ team.owner }}
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-card>
</template>


<script>
  export default {
    name: 'TeamCard',
    props: ['team'],
  }
</script>
