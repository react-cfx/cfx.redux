import {
  toActionsTypes
  mergeActionsTypes
} from 'cfx.redux-types'
import { createActions } from 'cfx.redux-actions'
import { mergeReducers } from './reducers'
import { mergeSagas } from './sagas'

export default ({
  reducers
  sagas
}) =>

  _ = {
    reducers
    sagas
  }

  merged =
    reducers: mergeReducers _.reducers
    sagas: mergeSagas _.sagas if _.sagas?
  
  constants =
    reducers: merged.reducers.constants
    sagas: merged.sagas.constants

  _ = {
    _...
    {
      constants
    }...
  }

  constants = mergeActionsTypes
    reducers: toActionsTypes _.constants.reducers
    sagas: toActionsTypes _.constants.sagas

  { types } = constants

  {
    constants
    types
    actions: createActions constants.actions
    initStates: merged.reducers.initStates
    reducers: merged.reducers.reducers
    sagas: merged.sagas.sagas { types }
    _
  }
