import Vue    from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Home from 'views/Home'
import { UserLogin } from './views/users'

const router =  new Router({
  mode: 'history',
  scrollBehavior: () => ({ y: 0 }),
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/users/login',
      name: 'UserLogin',
      component: UserLogin
    }
  ]
})

export default router