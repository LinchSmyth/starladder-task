<style scoped lang="scss">
  .shadowed-text {
    text-shadow: 1px 1px 3px black;
  }
</style>


<template>
<v-main>

  <v-layout column>
    <v-flex md12>
      <v-card>
        <v-card-media src="http://www.apu.edu.my/sites/default/files/dota2.jpeg" height="300px">
          <v-container fill-height fluid>
            <v-layout fill-height align-center column>
              <v-layout flexbox align-end>
                <span class="headline white--text shadowed-text">{{tournament.name}}</span>
              </v-layout>
              <v-layout flexbox align-end>
                <v-btn
                    color="success"
                    v-if="!isAnyTeamRegistered"
                    @click="registerTeam"
                >
                  register your team now!
                </v-btn>
              </v-layout>
            </v-layout>
          </v-container>
        </v-card-media>

        <v-card-title>
          <v-spacer/>
          <p class="ma-0">Tournament description. Lorem ipsum dolor sit amet, consectetur adipisicing elit. At, quo?</p>
          <v-spacer/>
        </v-card-title>
      </v-card>
    </v-flex>


    <v-container grid-list-md class="py-4 px-0">
      <v-data-iterator
          content-tag="v-layout"
          row
          wrap
          hide-actions
          :rows-per-page-items="[-1]"
          :items="teams"
          no-data-text="No teams registered for now"
      >
        <v-flex xs12 sm6 md4 lg3 slot="item" slot-scope="props">
          <team-card :team="props.item"/>
        </v-flex>
      </v-data-iterator>
    </v-container>
  </v-layout>

</v-main>
</template>


<script>
  import TeamCard from './components/TeamCard'

  export default {
    name: 'TeamsList',
    components: { TeamCard },
    data() {
      return {
        teams: [],
        tournament: {},
      }
    },

    mounted() {
      this.$http
        .get(`/api/tournaments/${ this.$route.params.id }`)
        .then(
          res => {
            this.tournament = res.body.tournament
          },
          err => {}
        )

      this.$http
          .get(`/api/${this.$route.path}`)
          .then(
            res => {
              this.teams = res.body.teams
            },
            err => {}
          )
    },

    methods: {
      registerTeam() {
        if (!!localStorage.getItem('auth-token')) {
          this.$router.push({ name: 'NewTeam' })
        }
        else {
          this.$router.push({ path: '/auth/starladder' })
          location.reload();
        }
      },
    },

    computed: {
      isAnyTeamRegistered() {
        return this.teams.filter((team) => { return team.is_owner }).length > 0
      },
    }
  }
</script>