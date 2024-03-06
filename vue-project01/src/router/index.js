import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/test',
    name: 'test',
    component: () => import( '../views/TestView.vue')
  },
  {
    path: '/home',
    name: 'home',
    component: () => import( '../views/HomeView.vue')
  },
  {
    path: '/song',
    name: 'song',
    component: () => import( '../views/SongView.vue')
  },
  {
    path: '/user',
    name: 'user',
    component: () => import( '../views/UserView.vue')
  },
  {
    path: '/index',
    name: 'index',
    component: () => import( '../views/IndexView.vue')
  },
  {
    path: '/',
    redirect: '/login'
  },
  {
    path: '/singer',
    name: 'singer',
    component: () => import( '../views/singerView.vue')
  },
  {
    path: '/login',
    name: 'login',
    component: () => import( '../views/LoginView.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router

export const saveUser=(params)=>postMessage('/saveUser',params);
