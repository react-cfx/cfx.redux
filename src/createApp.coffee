import createRedux from '../src/createRedux'
import createStore from '../src/createStore'
import promiseWapper from '../src/dispatch'

export default ({
  appName
  redux: {
    initializations
    reducers
    sagas
  }
  subscriber
  # async:
  # sync:
}) =>

  redux = createRedux {
    initializations
    reducers
    sagas
  }

  store = createStore {
    appName
    reducers
    (
      if sagas?
      then { sagas }
      else {}
    )...
    (
      if subscriber?
      then { subscriber }
      esle {}
    )...
  }

  dispatch = promiseWapper {
    store
    actions: redux.constatns.actions
  }

  {
    store
    dispatch
    _: {
      redux
        # constants
        # types
        # actions
        # initStates
        # reducers
        # sagas
      tools: {
        createRedux
        createStore
        promiseWapper
      }
    }
  }
