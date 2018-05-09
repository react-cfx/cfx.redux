# import dd from 'ddeyes'

import { toSaga } from '../../src'
import { sagaEffects } from 'cfx.redux.saga'

delay = (ms) =>
  new Promise (resolve) =>
    setTimeout resolve, ms

export default

  count: toSaga

    INCREMENT_ASYNC: ({ types }) => (
      action
      {
        store
        actions
        dispatch
      }
    ) ->

      # dd
      #   type: action.type
      #   actions: Object.keys actions

      yield sagaEffects.call delay, 1000

      # yield sagaEffects.put {
      #   action...
      #   type: types.INCREMENT
      # }

      # yield store.dispatch(
      #   actions.increment action.payload
      # )

      yield dispatch.increment action.payload

    DECREMENT_ASYNC: ({ types }) => (
      action
      {
        store
        actions
        dispatch
      }
    ) ->

      yield sagaEffects.call delay, 1000
      yield dispatch.decrement action.payload
