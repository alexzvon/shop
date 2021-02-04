<template>
  <v-app>
    <v-card-actions class="card_header_top pa-0">
      <v-container class="container-top pa-2">
      <v-row>
        <v-col md="6" >
          <v-card class="pa-0 container_card-top_left" outlined tile>
            <v-btn color="#696763" x-small plain>
              <v-icon x-small>mdi-phone</v-icon>
              <span>2 95 01 88 821</span>
            </v-btn>
            <v-btn color="#696763" x-small plain>
              <v-icon x-small>mdi-email</v-icon>
              <span>info@mail.ru</span>
            </v-btn>
          </v-card>
        </v-col>
          <v-col  md="6" >
          <v-card class="pa-0 container_card-top_right" outlined tile align="right">
              <v-btn-toggle
                v-model="btn_top_right"
                background-color="#F0F0E9"
                borderless
                v-on:change="mesbtn"
              >
                <v-btn
                  v-for="(item, i) in top_right_btn"
                  :key="i"
                  x-small
                  class="pa-0"
                >
                  <v-icon color="#696763" small>{{ item }}</v-icon>
                </v-btn>
              </v-btn-toggle>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    </v-card-actions>
    <v-card-actions class="card_header_middle pa-0">
      <v-container class="container-middle ps-2">
      <v-row>
        <v-col md="4" align="left" style="padding-top: 32px;">
            <v-text-field
              v-model="search"
              rounded
              filled
              dense
              outlined
              clearable
              label="Поиск"
              type="text"
              @change="onSearch"
              @click:prepend="onSearch"
            >
              <template v-slot:prepend>
                <v-icon>mdi-magnify</v-icon>
              </template>
              <template v-slot:append>
                <v-fade-transition leave-absolute>
                  <v-progress-circular
                    v-if="loading"
                    size="24"
                    color="info"
                    indeterminate
                  ></v-progress-circular>
                  <img
                    v-else
                    width="24"
                    height="24"
                    src="https://cdn.vuetifyjs.com/images/logos/v-alt.svg"
                    alt=""
                  >
                </v-fade-transition>
              </template>
            </v-text-field>
        </v-col>
        <v-col md="4" align="center">
          <NuxtLink to="/">
            <img src="~/assets/images/logo2.png" :width="200"/>
          </NuxtLink>
        </v-col>
        <v-col md="4" align="right" height="100%" class="d-flex flex-row align-center justify-end">
          <v-btn-toggle
            v-model="header_menu"
            text
            dense
            borderless
          >
            <v-btn
              v-for="(item, value) in list_header_menu"
              :key="value"
              :value="item.value"
              :to="item.route"
              small
            >
              {{ item.name }}
            </v-btn>
          </v-btn-toggle>
        </v-col>
      </v-row>
    </v-container>
    </v-card-actions>
    <v-container>
      <v-card>
        <v-btn-toggle
          v-model="onMenu"
          borderless
          class="d-flex justify-space-between"
          color="teal lighten-1"
        >
          <v-btn
            v-for="(item, i) in menus"
            :key="i"
            text
            small
          >
            {{ item }}
          </v-btn>
        </v-btn-toggle>
      </v-card>
    </v-container>


    <nuxt />
  </v-app>
</template>

<script>
  export default {
    data() {
      return {
        top_right_btn: [ 'mdi-heart-outline', 'mdi-account-outline', 'mdi-cart-outline'],
        btn_top_right: '',
        search: '',
        loading: false,
        header_menu: '',
        list_header_menu: [
          { name: 'Оплата', value: 'pay', route: '/'},
          { name: 'О нас', value: 'about', route: '/about'}
        ],
        menus: [ 'Новинки', 'Уход за лицом', 'Макияж', 'Тело и волосы', 'Наборы и миниатюры', 'Бренд', 'Скидки', 'Хит'],
        onMenu: '',
      }
    },
    methods: {
      mesbtn() {
        alert(this.btn_top_right);
      },
      onSearch: function () {

        console.log(this.search);

        this.loading = true
        console.log(this.loading);

        setTimeout(() => {
          this.loading = false;
          this.search = '';
        }, 3000);

      },
    }
  }
</script>

<style lang="scss">
  .card_header_top {
    background: none repeat scroll 0 0 #F0F0E9;
    .container-top {
      background: none repeat scroll 0 0 #F0F0E9;
      box-sizing: border-box;

      .container_card-top_right, .container_card-top_left {
        border: none;
        background-color: rgba(0, 0, 0, 0);
      }
    }
  }

  .card_header_middle {
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
  }
</style>
