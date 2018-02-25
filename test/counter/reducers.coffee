import dd from 'ddeyes'
import { handleReducer } from '../../src/reduce'

import initialState from './initialState'

export default
  count: handleReducer

    INCREMENT: (state, action = {}) =>
      action.payload or= 1
      state + action.payload

    DECREMENT: (state, action = {}) =>
      action.payload or= 1
      state - action.payload

  , initialState.count
