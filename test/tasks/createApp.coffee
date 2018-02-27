import dd from 'ddeyes'

import createApp from '../../src/createApp'
import reducerObjs from '../counter/reducers'

export default =>

  myApp = createApp
    redux:
      reducers: reducerObjs
    subscriber:
      sync: (store) =>
        dd store.getState()

  dd myApp.store.getState()

  action = myApp._.actions.increment 5

  myApp.store.dispatch action

  dd await myApp.dispatch.increment 1
  dd await myApp.dispatch.increment 1
