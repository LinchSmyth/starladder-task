<template>
<v-layout>


  <v-flex xs12 sm8 md6 lg4 offset-sm2 offset-md3 offset-lg4>
    <v-alert type="error" v-for="e in errors" :value="e">
      {{ e }}
    </v-alert>

    <div class="mb-4"></div>

    <command-form :command="command">
      <v-spacer/>
      <v-btn flat color="success" @click="createCommand">register</v-btn>
    </command-form>
  </v-flex>


</v-layout>
</template>


<script>
  import CommandForm from './components/Form'

  export default {
    name: 'NewCommand',
    components: { CommandForm },

    data() {
      return {
        command: {
          name: '',
          logo: null,
        },

        errors: [],
      }
    },

    methods: {
      createCommand() {
        const data = new FormData
        data.append('command[logo]', this.command.logo)
        data.append('command[name]', this.command.name)

        this.$http
            .post(
              `/tournaments/${this.$route.params.id}/commands`,
              data)
            .then(
              res => {
                this.$router.push({ name: 'CommandsList', params: { id: this.$route.params.id } })
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
