<template>
  <div class="home">
      <md-dialog-alert
              :md-active.sync="notFound"
              :md-content="`${error.cod}: ${error.message}`"
              md-confirm-text="OK" />

      <search-form @search="addCity"/>
      <div v-if="userLocation.coord">
          <h5>Weather in {{ userLocation.name }}: {{userLocation.main.temp | celsius }}</h5>
          <GmapMap v-if="userLocation.coord"
                   :center="{lat: userLocation.coord.lat, lng: userLocation.coord.lon}"
                   :zoom="10"
                   map-type-id="terrain"
                   style="width: 100%; height: 300px"
          >
              <GmapMarker v-if="userLocation.coord"
                          :position="{lat: userLocation.coord.lat, lng: userLocation.coord.lon}"
                          :clickable="true"
                          :draggable="true"
              />
          </GmapMap>
      </div>
      <div class="md-layout md-gutter">
          <div v-for="city in cities" :key="city.id" class="md-layout-item md-size-33 md-small-size-50 md-xsmall-size-100">
              <city-item :city="city" @remove="removeCity"/>
          </div>
      </div>
  </div>
</template>

<script>
// @ is an alias to /src
import CityItem from "@/components/CityItem";
import SearchForm from "@/components/SearchForm";
import { mapState } from "vuex";

export default {
  name: "home",
  components: {
    CityItem,
    SearchForm
  },
  data() {
    return {
      geoDialog: false,
      geoErr: ""
    };
  },
  computed: {
    ...mapState(["cities", "userLocation", "error"]),
    notFound: {
      get() {
        return this.$store.state.notFound;
      },
      set() {
        this.$store.commit("NOT_FOUND", { active: false, error: {} });
      }
    }
  },
  methods: {
    addCity(event) {
      this.$store.dispatch("GET_WEATHER", { params: { q: event } });
    },
    removeCity(id) {
      this.$store.commit("DELETE_CITY", id);
    },
    askForLocation() {
      if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition(position => {
          const { coords } = position;
          this.$store.dispatch("GET_WEATHER", {
            params: {
              lat: coords.latitude,
              lon: coords.longitude
            },
            action: "SET_USER_LOCATION"
          });
        });
      } else {
        console.log("Geo location is not allowed");
      }
    }
  },
  mounted() {
    this.askForLocation();
  }
};
</script>

<style lang="scss">
.md-layout-item {
  padding-top: 8px;
  padding-bottom: 8px;
}
</style>
