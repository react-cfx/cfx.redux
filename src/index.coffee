import redux from 'redux'

{
  createStore
  applyMiddleware
  combineReducers
} = redux

import { SagaMiddleware } from 'cfx.redux-saga'
import onStateChange from 'redux-on-state-change'

import SI from 'cfx.seamless-immutable'

CreateStore = (reducers, pluginList = []) ->
  createStore(
    combineReducers reducers
    applyMiddleware.apply @, pluginList
  )

mergeReduce = (
  reduceMap
  defaultState
  options
) ->

  unless defaultState
    throw new Error 'must be provided a default state.'

  (state = defaultState, action) ->

    isImmutable =
      unless options?.immutable?
      then true # default true
      else
        if options.immutable is false
        then false else true

    state = SI.new state if isImmutable

    r = {}
    for reduceName, reduce of reduceMap
      r[reduceName] = reduce state[reduceName], action
    r

getStore = ({
  appName
  reducers
  options...
  # sagas
  # subscriber
  #   async:
  #   sync:
}) ->

  {
    subscriber
  } = options if options?.subscriber?

  if options?.sagas?
    SagaMW = new SagaMiddleware()

  store = CreateStore
    "#{appName}": reducers
  , [
    (
      if options?.sagas?
      then [
        SagaMW.getMidleware()
      ]
      else []
    )...
    (
      if subscriber?.async?
      then [
        onStateChange (args...) ->
          subscriber.async.apply store, args
      ]
      else []
    )...
  ]

  if subscriber?.sync?
    store.onsubscribe = store.subscribe subscriber.sync

  if options?.sagas?
    # SagaMW.runSagas options.sagas
    store.runSagaTask = =>
      store.sagaTask = SagaMW.runSagas options.sagas
    store.runSagaTask()

  store

export {
  redux
  CreateStore
  mergeReduce
  getStore
}
