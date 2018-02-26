<template>
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
    <slot/>
  </v-card-actions>


</v-card>
</template>


<script>
  import FileUpload from './FileUpload'

  export default {
    name: 'CommandForm',
    components: { FileUpload },
    props: {
      command: [Object],
    },
  }
</script>
