import dd from 'ddeyes'
import 'shelljs/make'
import reducerObjs from './counter/reducers'
import { mergeReducer } from '../src/reduce'
import createStore from '../src/createStore'
# import { reduxActions } from 'cfx.redux-actions'
import actions from './counter/actions'
import createRedux from '../src/createRedux'

target.all = =>
  dd 'Hello World!!!'

target.reducers = =>

  # dd reducers
  {
    reducers
    initState
    constants
  } = mergeReducer reducerObjs

  dd {
    initState
    constants
  }

  # (
  #   Object.keys reducers
  # ).forEach (c, i, a) =>
  #   dd Object.keys reducers[c].reducer


  # myReducers = (
  #   mergeReducer reducers
  # ).reducer

  # dd myReducers

  # myReducers = reduxActions.handleActions reducers.count.reducer
  # , reducers.count.initState

  # dd myReducers

  # action = actions.increment 5

  # dd action

  # dd myReducers
  #   count: 10
  # ,
  #   action

  # dd myReducers undefined
  # ,
  #   action

  # myStore = createStore
  #   reducers: myReducers
  #   subscriber:
  #     sync: (store) =>
  #       dd store.getState()

  # dd myStore.getState()

  # myStore.dispatch action

target.redux = =>

  myRedux = createRedux
    reducers: reducerObjs

  dd myRedux

  myStore = createStore
    reducers: myRedux.reducers
    subscriber:
      sync: (store) =>
        dd store.getState()

  dd myStore.getState()

  action = myRedux.actions.increment 5

  myStore.dispatch action
