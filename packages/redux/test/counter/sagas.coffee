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
    ) ->

      yield sagaEffects.call delay, 1000
      yield sagaEffects.put {
        action...
        type: types.INCREMENT
      }

    DECREMENT_ASYNC: ({ types }) => (
      action
    ) ->

      yield sagaEffects.call delay, 1000
      yield sagaEffects.put {
        action...
        type: types.DECREMENT
      }
