<template>
  <div class="city" v-if="city.name">
      <h1 class="city-title">
          <router-link tag="md-button" class="md-fab" to="/"><md-icon>keyboard_backspace</md-icon></router-link>
          {{city.name}}, {{city.sys.country}}
      </h1>
    <div v-for="weather in city.weather" :key="weather.id">
      <img :src="`//openweathermap.org/img/w/${weather.icon}.png`" :title="weather.main" :alt="weather.main">
        <span>{{weather.main}}</span>
    </div>
    <table>
        <tr>
            <th>Temperature</th>
            <td>{{city.main.temp | celsius }}</td>
        </tr>
        <tr>
            <th>Humidity</th>
            <td>{{ city.main.humidity }} %</td>
        </tr>
        <tr>
            <th>Pressure</th>
            <td>{{ city.main.pressure }} hPa</td>
        </tr>
        <tr>
            <th>Wind</th>
            <td>{{city.wind.speed}} meter/sec | {{city.wind.deg}} °</td>
        </tr>
        <tr>
            <th>Sunrise</th>
            <td>{{ new Date(city.sys.sunrise) | dateFormat('HH:mm')}}</td>
        </tr>
        <tr>
            <th>Sunset</th>
            <td>{{ new Date(city.sys.sunset) | dateFormat('HH:mm')}}</td>
        </tr>
        <tr>
            <th>Cloudiness</th>
            <td>{{city.clouds.all}} %</td>
        </tr>
    </table>
    <GmapMap v-if="city.coord"
            :center="{lat: city.coord.lat, lng: city.coord.lon}"
            :zoom="10"
            map-type-id="terrain"
            style="width: 100%; height: 300px"
    >
        <GmapMarker v-if="city.coord"
                    :position="{lat: city.coord.lat, lng: city.coord.lon}"
                    :clickable="true"
                    :draggable="true"
        />
    </GmapMap>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "City",
  computed: {
    ...mapState({ city: "currentCity" })
  },
  mounted() {
    this.$store.dispatch("GET_WEATHER", {
      params: this.$route.params,
      action: "SET_CURRENT_CITY"
    });
  }
};
</script>

<style lang="scss">
.city-title {
  display: flex;
  align-items: center;
}
table th {
  text-align: left;
}
</style>
