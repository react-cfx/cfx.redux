import dd from 'ddeyes'
import 'shelljs/make'
import * as Counter from './counter'

import createStore from '../src/createStore'

target.all = =>
  dd 'Hello World!!!'

target.Counter = =>

  dd
    constants: Counter.constants
    types: Counter.types
    actions: Object.keys Counter.actions

target.CounterSyncCreateStore = =>

  store = createStore
    appName: 'CounterApp'
    reducers: Counter.reducers
    subscriber:
      sync: (store) =>
        dd store.getState()

  dd store.getState()

  store.dispatch Counter.actions.increment
    payload: 1
    success: (state) =>
      dd { state }

  store.dispatch Counter.actions.increment()

target.CounterAsyncCreateStore = =>

  subscriber = (
    prevState
    nextState
    action
    dispatch
  ) ->
    dd @getState()

  store = createStore
    appName: 'CounterApp'
    reducers: Counter.reducers
    sagas: Counter.sagas
    subscriber:
      async: subscriber

  dd store.getState()

  store.dispatch Counter.actions.incrementAsync
    payload: 1
    success: (state) =>
      dd { state }

  # store.dispatch Counter.actions.incrementAsync()
