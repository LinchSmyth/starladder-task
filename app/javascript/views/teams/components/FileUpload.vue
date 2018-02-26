<style scoped lang="scss">
  input[type=file] {
    position: absolute;
    left: -99999px;
  }

  .img-container {
    position: relative;
    height: 108px;
    border-radius: 4px;
    cursor: pointer;

    img {
      position: absolute;
      margin: auto;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
    }
  }

  .actions {
    margin-left: -8px;
    margin-right: -8px;
  }
</style>


<template>
<div>

  <div class="img-container" :style="{ 'background-color': bgColor }" @click="onPickFile">
    <img
      v-if="imageUrl"
      :src="imageUrl"
      ref="imageUrl"
      height="100"
      class="text-xs-center"
    >
  </div>
  <div class="actions">
    <v-btn flat class="primary--text" @click="onPickFile" v-if="!imageUrl">
      {{ selectLabel }}
    </v-btn>
    <v-btn flat class="warning--text" @click="onPickFile" v-if="imageUrl">
      {{ changeLabel }}
    </v-btn>
    <v-btn flat class="error--text" @click="removeFile" v-if="imageUrl && removable">
      {{ removeLabel }}
    </v-btn>

    <input
      type="file"
      ref="image"
      name="image"
      :accept="accept"
      @change="onFilePicked"
    >
  </div>
  <div>
    <p class="grey--text">Image will be resized to 200x200px</p>
  </div>

</div>
</template>


<script>
  export default {
    props: {
      value: [File, String],
      accept: {
        type: String,
        default: '*'
      },
      selectLabel: {
        type: String,
        default: 'Select an image'
      },
      removeLabel: {
        type: String,
        default: 'Remove'
      },
      changeLabel: {
        type: String,
        default: 'select another one'
      },
      removable: {
        type: Boolean,
        default: false
      },
      bgColor: {
        type: String,
        default: 'transparent'
      }
    },

    data() {
      return {
        imageUrl: ''
      }
    },

    watch: {
      value(v) {
        this.imageUrl = v
      }
    },

    mounted() {
      this.imageUrl = this.value
    },

    methods: {
      onPickFile() {
        this.$refs.image.click()
      },

      onFilePicked(event) {
        const files = event.target.files || event.dataTransfer.files

        if (files && files[0]) {
          let filename = files[0].name

          if (filename && filename.lastIndexOf('.') <= 0) {
            return //return alert('Please add a valid image!')
          }

          const fileReader = new FileReader()
          fileReader.addEventListener('load', () => {
            this.imageUrl = fileReader.result
          })
          fileReader.readAsDataURL(files[0])

          this.$emit('input', files[0])
        }
      },

      removeFile() {
        this.imageUrl = ''
      }
    }
  }
</script>
