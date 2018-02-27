import dd from 'ddeyes'

import createRedux from './createRedux'
import createStore from '../../src/createStore'

export default =>

  redux = createRedux()

  myStore = createStore
    reducers: redux.reducers
    subscriber:
      sync: (store) =>
        dd store.getState()

  dd myStore.getState()

  action = redux.actions.increment 5

  myStore.dispatch action
