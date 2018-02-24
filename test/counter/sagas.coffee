import dd from 'ddeyes'
import {
  handleActions
  merge
} from '../../src/sagas'
import {
  sagaEffects
  dispatch
} from 'cfx.redux-saga'
import constants from './constants'

delay = (ms) ->
  new Promise (resolve) ->
    setTimeout resolve, ms

{
  INCREMENT
  INCREMENT_ASYNC

  DECREMENT
  DECREMENT_ASYNC
} = constants.types

counter = handleActions
  INCREMENT_ASYNC: (action) ->
    # dd { INCREMENT }
    yield sagaEffects.call delay, 1000
    yield dispatch action
    , INCREMENT
    success: true

  DECREMENT_ASYNC: (action) ->
    # dd { DECREMENT }
    yield sagaEffects.call delay, 1000
    yield dispatch action
    , DECREMENT
    success: true

export default merge counter
