import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";

axios.defaults.baseURL = "https://api.openweathermap.org/data/2.5/";
axios.defaults.params = {
  APPID: "26e150de0e59e398931e697b667d7c4b"
};

Vue.use(VueAxios, axios);
