# import dd from 'ddeyes'
import createRedux from '../src/createRedux'
import createStore from '../src/createStore'
import promiseWapper from '../src/dispatch'

export default ({
  reducers
  sagas
  onSubscribe
  onChange
}) =>

  redux = createRedux {
    reducers
    sagas
  }

  store = createStore {
    reducers: redux.reducers
    sagas: redux.sagas
    onSubscribe
    onChange
  }

  _dispatch = promiseWapper {
    store
    actions: redux.actions
    reducersOrSagas: redux._.reducersOrSagas
  }

  dispatch = (
    Object.keys _dispatch
  ).reduce (r, c) =>
    {
      r...
      "#{c}": ( payload ) =>
        _dispatch[c] {
          payload
          dispatch
        }
    }
  , {}

  {
    store
    dispatch
    _: redux
  }
