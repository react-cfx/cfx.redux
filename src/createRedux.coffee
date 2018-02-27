import { toActionsTypes } from 'cfx.redux-types'
import { createActions } from 'cfx.redux-actions'
import { mergeReducers } from './reducers'

export default ({
  reducers
  sagas
}) =>

  _ = {
    reducers
  }

  {
    reducers
    initStates
    constants
  } = mergeReducers _.reducers

  _ = {
    _...
    {
      constants
    }...
  }

  constants = toActionsTypes _.constants

  {
    constants
    types: constants.types
    actions: createActions constants.actions
    initStates
    reducers: reducers
    sagas
    _
  }
