import dd from 'ddeyes'

import createRedux from './createRedux'
import { createStore } from './cfxRedux'

export default =>

  redux = createRedux()

  myStore = createStore
    reducers: redux.reducers
    sagas: redux.sagas
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

  dd myStore.getState()

  syncAction = redux.actions.increment 5
  myStore.dispatch syncAction

  asyncAction = redux.actions.incrementAsync 5
  myStore.dispatch asyncAction
