<template>
    <div class="md-layout md-gutter">
        <div class="md-layout-item ">
            <md-field>
                <label>Enter city</label>
                <md-input v-model="city" @keyup.enter="submit"></md-input>
                <md-button class="md-raised md-primary" :disabled="!city" @click="submit">Add</md-button>
            </md-field>
        </div>
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
    submit() {
      if (this.city) {
        this.$emit("search", this.city);
        this.city = "";
      }
    }
  }
};
</script>

<style scoped>
</style>
