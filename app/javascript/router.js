import Vue    from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Home from 'views/Home'

const router =  new Router({
  mode: 'history',
  scrollBehavior: () => ({ y: 0 }),
  routes: [
    // Organization
    {
      path: '/',
      name: 'Home',
      component: Home
    },
  ]
})

export default router