# import dd from 'ddeyes'

import createRedux from '../src/createRedux'
import createStore from '../src/createStore'
import promiseWapper from '../src/dispatch'

export default ({
  redux: {
    reducers
    sagas
  }
  subscriber
  # async:
  # sync:
}) =>

  redux = createRedux {
    reducers
    sagas
  }

  store = createStore {
    reducers: redux.reducers
    (
      if redux.sagas?
      then sagas: redux.sagas
      else {}
    )...
    (
      if subscriber?
      then { subscriber }
      else {}
    )...
  }

  dispatch = promiseWapper {
    store
    actions: redux.actions
  }

  {
    store
    dispatch
    _: redux
  }
