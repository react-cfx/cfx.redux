import dd from 'ddeyes'

import {
  reducers as reducersObj
  sagas as sagasObj
} from '../counter'
import { createApp } from './cfxRedux'

export default =>

  myApp = createApp
    reducers: reducersObj
    sagas: sagasObj
    onSubscribe: (store) =>
      dd store.getState()
    onChange: (
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
