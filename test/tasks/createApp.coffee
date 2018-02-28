import dd from 'ddeyes'

import {
  reducers as reducersObj
  sagas as sagasObj
} from '../counter'
# import { createApp } from '../../src'
import { createApp } from '../../dist/bundle'

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

  dd await myApp.dispatch.increment 2
  dd await myApp.dispatch.incrementAsync 3
