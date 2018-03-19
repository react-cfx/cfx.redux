import dd from 'ddeyes'

import {
  reducers
  sagas
  newSagas
} from '../counter'
import { createApp } from './cfxRedux'

export default =>

  myApp =
    onlyReducers: createApp {
      reducers 
      onSubscribe: (store) =>
        dd store.getState()
    }
    all: createApp {
      reducers
      sagas
      onChanged: (
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
    }
    newSagas: createApp
      reducers: reducers
      sagas: newSagas
      onChanged: (
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

  dd "  newSagas =>"
  dd myApp.newSagas.store.getState()

  dd await myApp.newSagas.dispatch.incrementAsync 5
  dd await myApp.newSagas.dispatch.decrementAsync 3

  dd "  all =>"
  dd myApp.all.store.getState()

  myApp.all.store.dispatch(
    myApp.all._.actions.incrementAsync 5
  )
  myApp.all.store.dispatch(
    myApp.all._.actions.decrementAsync 3
  )
