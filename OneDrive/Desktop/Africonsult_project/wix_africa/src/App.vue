<template>
<div>
  <NavBar/>
  <Hero/>
  <ServiceSect/>
</div>
  
</template>

<script>
import NavBar from './components/NavBar.vue'
import Hero from './components/HeroComp.vue'
import ServiceSect from './components/ServiceSect.vue'

export default {
  name: 'App',
  components: {
    NavBar,
    Hero,
    ServiceSect
  }
}
</script>

