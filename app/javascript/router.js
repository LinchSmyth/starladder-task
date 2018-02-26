import Vue    from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Home from 'views/Home'
import { UserLogin } from './views/users'
import { TournamentsList } from './views/tournaments'
import { CommandsList, NewCommand, EditCommand } from './views/commands'

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
    // commands
    {
      path: '/tournaments/:id/commands',
      name: 'CommandsList',
      component: CommandsList
    },
    {
      path: '/tournaments/:id/commands/new',
      name: 'NewCommand',
      component: NewCommand
    },
    {
      path: '/commands/:id/edit',
      name: 'EditCommand',
      component: EditCommand
    },
  ]
})

export default router