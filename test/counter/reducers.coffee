import dd from 'ddeyes'
import {
  handleActions
  merge
} from '../../src/reduce'

import initialState from './initialState'

count = handleActions

  INCREMENT: (state, action = {}) =>
    action.payload or= 1
    state + action.payload

  DECREMENT: (state, action = {}) =>
    action.payload or= 1
    state - action.payload

, initialState.count

export default merge {
  count
}
, initialState
