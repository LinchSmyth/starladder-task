<template>
<v-container grid-list-md>


  <v-data-iterator
      content-tag="v-layout"
      row
      wrap
      hide-actions
      :rows-per-page-items="[-1]"
      :items="tournaments"
  >
    <v-flex xs12 sm6 md4 lg3 slot="item" slot-scope="props">
      <v-card
        hover
        :ripple="{ class: 'indigo--text' }"
        :to="{ name: 'TeamsList', params: { id: props.item.id } }"
      >
        <v-card-title>
          <h4>{{ props.item.name }}</h4>
        </v-card-title>

        <v-divider/>

        <v-list dense>
          <v-list-tile>
            <v-list-tile-content>Registered:</v-list-tile-content>
            <v-list-tile-content class="align-end">
              {{ props.item.teams_count }}
            </v-list-tile-content>
          </v-list-tile>
        </v-list>
      </v-card>
    </v-flex>
  </v-data-iterator>


</v-container>
</template>


<script>
  export default {
    name: 'TournamentsList',
    data() {
      return {
        tournaments: []
      }
    },

    mounted() {
      this.$http
          .get('/tournaments')
          .then(
            res => {
              this.tournaments = res.body.tournaments
            },
            err => { console.log(err) }
          )
    },
  }
</script>
