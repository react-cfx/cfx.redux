import createStore from '../src/createStore'

export default (({
  appName
  redux: {
    constants
    initializations
    reducers
    sagas
  }
  subscriber
  # async:
  # sync:
}) =>

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

  {
    store
    dispatch
    _: {
      constants
      actions
      initializations
      reducers
      sagas
    }
  }
