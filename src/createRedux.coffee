import { toActionsTypes } from 'cfx.redux-types'
import { createActions } from 'cfx.redux-actions'
import { mergeReducer } from './reduce'

export default ({
  reducers
  sagas
}) =>
  _ = {
    reducers
  }

  {
    reducer
    initState
    constants
  } = mergeReducer _.reducers

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
    initState
    reducers: reducer
    sagas
    _
  }
