<template>
    <div>
        <md-field>
            <label>Enter city.<br> </label>
            <md-input v-model="city"></md-input>
            <md-button class="md-raised md-primary" @click="submit(city)">Add</md-button>
        </md-field>
        <div>Examples: Odessa | Odessa,UA</div>
    </div>
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
    submit(city) {
      this.city = "";
      this.$emit("search", city);
    }
  }
};
</script>

<style scoped>
</style>
