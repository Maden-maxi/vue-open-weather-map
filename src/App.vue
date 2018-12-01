<template>
  <div id="app" class="container">
    <router-view/>
  </div>
</template>
<script>
export default {
  name: "App",
  mounted() {
    this.$store.commit("SET_CITIES", this.$storage.get("cities") || []);
  }
};
</script>
<style lang="scss">
.container {
  max-width: 600px;
  padding: 0 15px;
  margin: auto;
}
</style>
