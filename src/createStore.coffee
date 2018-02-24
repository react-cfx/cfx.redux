# import dd from 'ddeyes'
import * as redux from 'redux'
{
  createStore
  applyMiddleware
  combineReducers
} = redux
import onStateChange from 'redux-on-state-change'
import { SagaMiddleware } from 'cfx.redux-saga'

CreateStore = (
  reducers
  pluginList = []
) =>
  createStore(
    combineReducers reducers
    applyMiddleware.apply null
    , pluginList
  )

export {
  CreateStore
}

export default ({
  appName
  reducers
  options...
  # sagas
  # subscriber
  #   async:
  #   sync:
}) =>

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
    store.onsubscribe = store.subscribe =>
      subscriber.sync.call store, store

  if options?.sagas?
    # SagaMW.runSagas options.sagas
    store.runSagaTask = =>
      store.sagaTask = SagaMW.runSagas options.sagas
    store.runSagaTask()

  store
