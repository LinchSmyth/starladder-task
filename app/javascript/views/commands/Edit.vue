<template>
<v-layout>


  <v-flex xs12 sm8 md6 lg4 offset-sm2 offset-md3 offset-lg4>
    <v-alert type="error" v-for="e in errors" :value="e">
      {{ e }}
    </v-alert>

    <div class="mb-4"></div>

    <command-form :command="command">
      <v-spacer/>
      <v-btn flat color="error" @click="deleteConfirmation = true">Delete</v-btn>
      <v-btn flat color="success" @click="updateCommand">Update</v-btn>
    </command-form>
  </v-flex>


  <v-dialog v-model="deleteConfirmation" persistent max-width="300px">
    <v-card>
      <v-card-title class="headline">Are you sure?</v-card-title>
      <v-card-text>This operation cannot be undone</v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="green" flat @click.native="deleteConfirmation = false">cancel</v-btn>
        <v-btn color="error" flat @click.native="deleteCommand">delete</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>


</v-layout>
</template>


<script>
  import CommandForm from './components/Form'

  export default {
    name: 'EditCommand',
    components: { CommandForm },

    data() {
      return {
        command: {
          name: '',
          logo: null,
        },

        errors: [],
        deleteConfirmation: false,
      }
    },

    mounted() {
      this.$http
          .get(`/commands/${this.$route.params.id}`)
          .then(
            res => {
              this.command = res.body.command
            },
            err => {
              console.log(err)
            }
          )
    },

    methods: {
      updateCommand() {
        const data = new FormData
        data.append('command[logo]', this.command.logo)
        data.append('command[name]', this.command.name)

        this.$http
            .put(
              `/commands/${this.$route.params.id}`,
              data)
            .then(
              res => {
                this.$router.push({ name: 'CommandsList', params: { id: res.body.command.tournament_id } })
              },
              err => {
                console.log(err)
                this.errors = err.body.errors
              }
            )
      },

      deleteCommand() {
        this.deleteConfirmation = false

        this.$http
            .delete(`/commands/${this.$route.params.id}`)
            .then(
              res => {
                this.$router.push({ name: 'CommandsList', params: { id: res.body.tournament_id } })
              },
              err => { console.log(err) }
            )
      }
    }
  }
</script>
