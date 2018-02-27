import dd from 'ddeyes'

import createRedux from './createRedux'
import createStore from '../../src/createStore'

export default =>

  redux = createRedux()

  myStore = createStore
    reducers: redux.reducers
    sagas: redux.sagas
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

  dd myStore.getState()

  syncAction = redux.actions.increment 5
  myStore.dispatch syncAction

  asyncAction = redux.actions.incrementAsync 5
  myStore.dispatch asyncAction
