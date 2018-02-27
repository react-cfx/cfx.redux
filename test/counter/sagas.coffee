# import dd from 'ddeyes'

import { toSaga } from '../../src'
import {
  sagaEffects
  dispatch
} from 'cfx.redux-saga'

delay = (ms) =>
  new Promise (resolve) =>
    setTimeout resolve, ms

export default

  count: toSaga

    INCREMENT_ASYNC: ({ types }) => (action) ->

      yield sagaEffects.call delay, 1000
      yield dispatch action
      , types.INCREMENT

      success: true

    DECREMENT_ASYNC: ({ types }) => (action) ->

      yield sagaEffects.call delay, 1000
      yield dispatch action
      , types.DECREMENT

      success: true
