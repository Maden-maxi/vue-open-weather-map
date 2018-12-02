<template>
    <form class="md-layout md-gutter">
        <div class="md-layout-item ">
            <md-field>
                <label>Enter city.<br> </label>
                <md-input v-model="city"></md-input>
                <md-button class="md-raised md-primary" :disabled="!city" @click="submit">Add</md-button>
            </md-field>
        </div>
    </form>
</template>

<script>
export default {
  name: "SearchForm",
  data() {
    return {
      city: ""
    };
  },
  methods: {
    submit() {
      this.$emit("search", this.city);
      this.city = "";
    }
  }
};
</script>

<style scoped>
</style>
