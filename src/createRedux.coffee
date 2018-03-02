# import dd from 'ddeyes'
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
    (
      if sagas?
      then { sagas }
      else {}
    )...
  }

  merged = {
    reducers: mergeReducers _.reducers
    (
      if _.sagas?
      then sagas: mergeSagas _.sagas
      else {}
    )...
  }

  constants = {
    reducers: merged.reducers.constants
    (
      if _.sagas?
      then sagas: merged.sagas.constants
      else {}
    )...
  }

  _ = {
    _...
    {
      constants
    }...
  }

  constants = mergeActionsTypes {
    reducers: toActionsTypes _.constants.reducers
    (
      if _.sagas?
      then sagas: toActionsTypes _.constants.sagas
      else {}
    )...
  }

  { types } = constants

  {
    constants
    types
    actions: createActions constants.actions
    initStates: merged.reducers.initStates
    reducers: merged.reducers.reducers
    (
      if _.sagas?
      then sagas: merged.sagas.sagas { types }
      else {}
    )...
    _
  }
