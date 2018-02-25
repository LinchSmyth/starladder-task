<template>
  <v-layout>
    <v-flex xs12 sm8 md6 lg4 offset-sm2 offset-md3 offset-lg4>
      <v-alert type="warning" :value="true" >
        Please, fill the fields below to complete your registration
      </v-alert>

      <div class="mb-4"></div>

      <v-card>
        <v-card-title>
          <v-layout column>
            <v-text-field
              v-for="f in incompletedFields"
              :key="f"
              :label="humanizedLabels[f]"
              v-model="user[f]"
              :rules="[() => user[f].length > 0 || 'This field is required']"
              required
            ></v-text-field>
          </v-layout>
        </v-card-title>

        <v-card-actions>
          <v-spacer/>
          <v-btn flat color="success" @click="updateUser">save</v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>


<script>
  export default {
    name: 'UserLogin',
    data() {
      return {
        incompletedFields: [],
        humanizedLabels: {},
        user: {},
      }
    },

    mounted() {
      const incomplete = this.$route.query.incomplete || null

      const authTokenNode = document.getElementById('auth-token')
      localStorage.setItem('auth-token', authTokenNode.innerText)
      authTokenNode.remove()

      if (incomplete) {
        window.eventBus.$emit('toggle-actions', false)

        this.prepareFieldset(
          [].concat.apply([], Array.of(incomplete)) // wraps a string or array in single-level array
        )
      }
      else {
        this.registrationCompleted()
      }
    },

    methods: {
      prepareFieldset(fields) {
        fields.forEach((field) => {
          this.incompletedFields.push(field)
          this.user[field] = ''
          this.humanizedLabels[field] =
            field.split('_')
                 .map((word) => { return [...word][0].toUpperCase() + [...word].slice(1).join('') })
                 .join(' ')
        })
      },

      updateUser() {
        if (Object.values(this.user).filter((el) => { return el.length < 1 }).length !== 0) {
          return
        }

        this.$http
            .put('/users', { user: this.user })
            .then(
              res => {
                this.registrationCompleted()
              },
              err => {}
            )
      },

      registrationCompleted() {
        window.eventBus.$emit('toggle-actions', true)
        this.$router.push({ name: 'Home' })
      },
    },
  }
</script>
