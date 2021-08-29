<template>
  <div id="app">
    <header-vue />
    <div id="site-template" class="container">
      <slot></slot>
    </div>
    <footer-vue />
  </div>
</template>

<script>

import HeaderVue from '@/components/HeaderVue';
import FooterVue from '@/components/FooterVue';
import store from '@/store';

export default {
  name: 'SiteTemplate',
  components: {
    HeaderVue,
    FooterVue
  },
  created(){
    if(store.state.token){
      if(!store.dispatch('checkAuth')){
        this.$router.push('/login');
      }
    }
  }
}
</script>

<style scoped>
#site-template{
  flex: 1;
}
</style>