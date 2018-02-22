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
      <v-card hover>
        <v-card-title>
          <h4>{{ props.item.name }}</h4>
        </v-card-title>

        <v-divider/>

        <v-list dense>
          <v-list-tile>
            <v-list-tile-content>Registered:</v-list-tile-content>
            <v-list-tile-content class="align-end">
              {{ props.item.commands_registered }}
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
        tournaments: [
          {
            name: 'DOTA 2 Amateurs league',
            commands_registered: 3
          },
          {
            name: 'DOTA 2 Professional league',
            commands_registered: 3
          },
          {
            name: 'DOTA 2 AllStars league',
            commands_registered: 3
          }
        ]
      }
    },

    mounted() {

    },
  }
</script>
