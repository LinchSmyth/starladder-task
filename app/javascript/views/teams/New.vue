<template>
<v-main>

  <v-layout>
    <v-flex xs12 sm8 md6 lg4 offset-sm2 offset-md3 offset-lg4>
      <v-alert type="error" v-for="e in errors" :value="e">
        {{ e }}
      </v-alert>

      <div class="mb-4"></div>

      <team-form :team="team">
        <v-spacer/>
        <v-btn flat color="success" @click="createTeam">register</v-btn>
      </team-form>
    </v-flex>
  </v-layout>

</v-main>
</template>


<script>
  import TeamForm from './components/Form'

  export default {
    name: 'NewTeam',
    components: { TeamForm },

    data() {
      return {
        team: {
          name: '',
          logo: null,
        },

        errors: [],
      }
    },

    methods: {
      createTeam() {
        const data = new FormData
        data.append('team[logo]', this.team.logo)
        data.append('team[name]', this.team.name)

        this.$http
            .post(
              `/api/tournaments/${this.$route.params.id}/teams`,
              data)
            .then(
              res => {
                this.$router.push({ name: 'TeamsList', params: { id: this.$route.params.id } })
              },
              err => {
                console.log(err)
                this.errors = err.body.errors
              }
            )
      }
    },
  }
</script>
