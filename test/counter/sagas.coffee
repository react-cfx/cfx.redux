# import dd from 'ddeyes'
import {
  toSagas
  mergeSagas
} from '../../src/sagas'
import {
  sagaEffects
  dispatch
} from 'cfx.redux-saga'

delay = (ms) =>
  new Promise (resolve) =>
    setTimeout resolve, ms

counter = toSagas

  INCREMENT_ASYNC: (action) ->

    yield sagaEffects.call delay, 1000
    yield dispatch action
    , INCREMENT

    success: true

  DECREMENT_ASYNC: (action) ->

    yield sagaEffects.call delay, 1000
    yield dispatch action
    , DECREMENT

    success: true

export default mergeSagas counter
