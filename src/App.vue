<template>
  <div id="app" class="container">
    <transition name="fade" mode="out-in">
      <router-view/>
    </transition>
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
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}
.fade-enter,
.fade-leave-active {
  opacity: 0;
}
</style>
