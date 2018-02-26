<template>
<v-layout>


  <v-flex xs12 sm8 md6 lg4 offset-sm2 offset-md3 offset-lg4>
    <v-alert type="error" v-for="e in errors" :value="e">
      {{ e }}
    </v-alert>

    <div class="mb-4"></div>

    <team-form :team="team">
      <v-spacer/>
      <v-btn flat color="error" @click="deleteConfirmation = true">Delete</v-btn>
      <v-btn flat color="success" @click="updateTeam">Update</v-btn>
    </team-form>
  </v-flex>


  <v-dialog v-model="deleteConfirmation" persistent max-width="300px">
    <v-card>
      <v-card-title class="headline">Are you sure?</v-card-title>
      <v-card-text>This operation cannot be undone</v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="green" flat @click.native="deleteConfirmation = false">cancel</v-btn>
        <v-btn color="error" flat @click.native="deleteTeam">delete</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>


</v-layout>
</template>


<script>
  import TeamForm from './components/Form'

  export default {
    name: 'EditTeam',
    components: { TeamForm },

    data() {
      return {
        team: {
          name: '',
          logo: null,
        },

        errors: [],
        deleteConfirmation: false,
      }
    },

    mounted() {
      this.$http
          .get(`/teams/${this.$route.params.id}`)
          .then(
            res => {
              this.team = res.body.team
            },
            err => {
              console.log(err)
            }
          )
    },

    methods: {
      updateTeam() {
        const data = new FormData
        data.append('team[logo]', this.team.logo)
        data.append('team[name]', this.team.name)

        this.$http
            .put(
              `/teams/${this.$route.params.id}`,
              data)
            .then(
              res => {
                this.$router.push({ name: 'TeamsList', params: { id: res.body.team.tournament_id } })
              },
              err => {
                console.log(err)
                this.errors = err.body.errors
              }
            )
      },

      deleteTeam() {
        this.deleteConfirmation = false

        this.$http
            .delete(`/teams/${this.$route.params.id}`)
            .then(
              res => {
                this.$router.push({ name: 'TeamsList', params: { id: res.body.tournament_id } })
              },
              err => { console.log(err) }
            )
      }
    }
  }
</script>
