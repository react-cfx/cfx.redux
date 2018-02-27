import dd from 'ddeyes'
import 'shelljs/make'
import reducers from './tasks/reducers'
import createRedux from './tasks/createRedux'
import createStore from './tasks/createStore'
import createApp from './tasks/createApp'

target.all = =>
  dd 'Hello World!!!'

target.reducers = => reducers()
target.createRedux = => createRedux()

target.createStore = => createStore()
target.createApp = => createApp()

# target.reducers = =>

  # dd reducers
  # {
  #   reducers
  #   initState
  #   constants
  # } = mergeReducer reducerObjs

  # dd {
  #   initState
  #   constants
  # }

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
