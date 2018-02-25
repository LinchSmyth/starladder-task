<template>
<v-layout>


  <v-flex xs12 sm8 md6 lg4 offset-sm2 offset-md3 offset-lg4>
    <v-card>
      <v-card-title>
        <v-layout column>
          <file-upload
            accept="'image/jpeg,image/jpeg,image/png'"
            select-label="select an image"
            remove-label="remove image"
            bg-color="#f3f3f3"
            v-model="command.logo"
          />

          <v-text-field label="Name" v-model="command.name"/>
        </v-layout>
      </v-card-title>

      <v-card-actions>
        <v-spacer/>
        <v-btn flat color="success" @click="createCommand">register</v-btn>
      </v-card-actions>
    </v-card>
  </v-flex>


</v-layout>
</template>


<script>
  import FileUpload from './components/FileUpload'

  export default {
    name: 'NewCommand',
    components: { FileUpload },

    data() {
      return {
        command: {
          name: '',
          logo: null,
        },
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
                console.log(res)
              },
              err => { console.log(err) }
            )
      }
    },
  }
</script>
