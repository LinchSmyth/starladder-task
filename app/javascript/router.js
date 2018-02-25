import Vue    from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Home from 'views/Home'
import { UserLogin } from './views/users'
import { TournamentsList } from './views/tournaments'
import { CommandsList } from './views/commands'

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
    },
    {
      path: '/tournaments',
      name: 'TournamentsList',
      component: TournamentsList
    },
    {
      path: '/tournaments/:id/commands',
      name: 'CommandsList',
      component: CommandsList
    },
  ]
})

export default router