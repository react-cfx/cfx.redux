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

  dispatch = promiseWapper {
    store
    actions: redux.actions
  }

  {
    store
    dispatch
    _: redux
  }
