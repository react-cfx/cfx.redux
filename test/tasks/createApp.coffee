import dd from 'ddeyes'

import {
  reducers as reducersObj
  sagas as sagasObj
  newSagas
} from '../counter'
import { createApp } from './cfxRedux'

myApp =
  onlyReducers: createApp
    reducers: reducersObj
    onSubscribe: (store) =>
      dd store.getState()
  all: createApp
    reducers: reducersObj
    sagas: sagasObj
    onChange: (
      prevState
      nextState
      action 
      dispatch
    ) =>
      dd {
        prevState
        nextState
        action: {
          type: action.type
          payload: 
            if action.payload?.payload?
            then action.payload.payload
            else action.payload
        }
      }
  newSagas: createApp
    reducers: reducersObj
    sagas: newSagas
    onChange: (
      prevState
      nextState
      action 
      dispatch
    ) =>
      dd {
        prevState
        nextState
        action: {
          type: action.type
          payload: 
            if action.payload?.payload?
            then action.payload.payload
            else action.payload
        }
      }

export default =>

  dd "Sync =>"

  dd myApp.onlyReducers.store.getState()

  myApp.onlyReducers.store.dispatch(
    myApp.onlyReducers._.actions.increment 5
  )
  myApp.onlyReducers.store.dispatch(
    myApp.onlyReducers._.actions.decrement 3
  )

  dd await myApp.onlyReducers.dispatch.increment 5
  dd await myApp.onlyReducers.dispatch.decrement 3

  dd "Async =>"

  dd myApp.all.store.getState()

  myApp.all.store.dispatch(
    myApp.all._.actions.incrementAsync 5
  )
  myApp.all.store.dispatch(
    myApp.all._.actions.decrementAsync 3
  )

  dd await myApp.newSagas.dispatch.incrementAsync 5
  dd await myApp.newSagas.dispatch.decrementAsync 3
