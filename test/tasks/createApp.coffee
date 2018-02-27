import dd from 'ddeyes'

import createApp from '../../src/createApp'
import {
  reducers as reducersObj
  sagas as sagasObj
} from '../counter'

export default =>

  myApp = createApp
    redux:
      reducers: reducersObj
      sagas: sagasObj
    subscriber:
      sync: (store) =>
        dd store.getState()
      async: (
        prevState
        nextState
        action 
        dispatch
      ) =>
        dd async: {
          prevState
          nextState
          action
        }

  dd myApp.store.getState()

  action = myApp._.actions.increment 5

  myApp.store.dispatch action

  dd await myApp.dispatch.increment 1
  dd await myApp.dispatch.incrementAsync 1
