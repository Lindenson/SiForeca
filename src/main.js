import 'devextreme/dist/css/dx.common.css';
import './themes/generated/theme.base.css';
import './themes/generated/theme.additional.css';

import Vue from "vue";
import App from "./App";
import router from "./router";
import appInfo from "./app-info";
import Vuex from 'vuex'


Vue.config.productionTip = false;
Vue.prototype.$appInfo = appInfo;


Vue.use(Vuex);
const store = new Vuex.Store({
  state: {
    token: "",
    loggedIn: false
  },
  mutations: {
    SET_TOKEN: (state, payload) => {
      state.token = payload;
    },
    SET_LOGGED: (state, payload) => {
      state.loggedIn = payload;
    }
  },
  actions: {
    setToken(state, payload) {
      state.commit('SET_TOKEN', payload);
    },
    setLogged(state, payload) {
      state.commit('SET_LOGGED', payload);
    }
  },
  getters: {
    getToken: state => {
       return state.token;
    },
    getLogged: state => {
      return state.loggedIn;
    }
  }
})

let vm=new Vue({
  router,
  store: store,
  render: h => h(App),
});
vm.$mount("#app");
