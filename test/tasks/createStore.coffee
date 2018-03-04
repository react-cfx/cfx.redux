import dd from 'ddeyes'

import createRedux from './createRedux'
import { createStore } from './cfxRedux'

redux = createRedux()

myStore =
  onlyReducers: createStore
    reducers: redux.reducers
    onSubscribe: (store) =>
      dd store.getState()
  all: createStore
    reducers: redux.reducers
    sagas: redux.sagas
    onChange: (
      prevState
      nextState
      action 
      dispatch
    ) =>
      dd {
        prevState
        nextState
        action
      }

export default =>

  dd "Sync =>"

  dd myStore.onlyReducers.getState()
  myStore.onlyReducers.dispatch redux.actions.increment 5
  myStore.onlyReducers.dispatch redux.actions.decrement 3

  dd "Async =>"

  dd myStore.all.getState()
  myStore.all.dispatch redux.actions.incrementAsync 5
  myStore.all.dispatch redux.actions.decrementAsync 3
