# import dd from 'ddeyes'
import {
  createStore
  applyMiddleware
} from 'redux'
import onStateChange from 'redux-on-state-change'
import { SagaMiddleware } from 'cfx.redux-saga'

CreateStore = (
  reducers
  pluginList = []
) =>
  createStore(
    reducers
    applyMiddleware.apply null
    , pluginList
  )

export {
  CreateStore
}

export default ({
  reducers
  sagas
  onSubscribe
  onChange
}) =>

  SagaMW = new SagaMiddleware() if sagas?

  store = CreateStore reducers
  , [
    (
      if sagas?
      then [
        SagaMW.getMidleware()
      ]
      else []
    )...
    (
      if onChange?
      then [
        onStateChange (
          prevState
          nextState
          action 
          dispatch
        ) =>
          onChange.apply store, [
            prevState
            nextState
            {
              action...
              (
                if action.payload?.payload?.payload?
                then payload: action.payload.payload.payload
                else {}
              )...
            }
            dispatch
          ]
      ]
      else []
    )...
  ]

  if onSubscribe?
    store.onsubscribe = store.subscribe =>
      onSubscribe.call store, store

  if sagas?
    store.runSagaTask = =>
      store.sagaTask = SagaMW.runSagas sagas
    store.runSagaTask()

  store
