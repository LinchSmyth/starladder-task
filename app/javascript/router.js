import Vue    from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Home from 'views/Home'
import { UserLogin } from './views/users'
import { TournamentsList } from './views/tournaments'
import { TeamsList, NewTeam, EditTeam } from './views/teams'

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
    // teams
    {
      path: '/tournaments/:id/teams',
      name: 'TeamsList',
      component: TeamsList
    },
    {
      path: '/tournaments/:id/teams/new',
      name: 'NewTeam',
      component: NewTeam
    },
    {
      path: '/teams/:id/edit',
      name: 'EditTeam',
      component: EditTeam
    },
  ]
})

export default router