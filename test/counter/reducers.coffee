# import dd from 'ddeyes'

import { toReducer } from '../../src'
import initStates from './initStates'

export default

  count: toReducer

    INCREMENT: (state, action = {}) =>
      action.payload or= 1
      state + action.payload

    DECREMENT: (state, action = {}) =>
      action.payload or= 1
      state - action.payload

  , initStates.count
