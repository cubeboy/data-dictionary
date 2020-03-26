import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Word from '../views/word/word.vue'
import Term from '../views/SearchTerms.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/word/',
    name: 'Word',
    component: Word
  },
  {
    path: '/term/',
    name: 'SearchTerm',
    component: Term
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
