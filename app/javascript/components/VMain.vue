<style lang="scss">
  main {
    padding-top: 48px;

    @media (min-width: 960px) {
      padding-top: 54px;
    }
  }
</style>


<template>
<main>

  <v-container v-if="!noContainer">
    <slot/>
  </v-container>
  <slot v-if="noContainer"/>

</main>
</template>


<script>
  export default {
    name: 'VMain',
    props: {
      noContainer: {
        type: Boolean,
        default: false
      },
    }
  }
</script>
