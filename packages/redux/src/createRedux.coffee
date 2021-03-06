# import dd from 'ddeyes'
import {
  toActionsTypes
  mergeActionsTypes
} from 'cfx.redux.type'
import { createActions } from 'cfx.redux.action'
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

  _constants = {
    reducers: toActionsTypes _.constants.reducers
    (
      if _.sagas?
      then sagas: toActionsTypes _.constants.sagas
      else {}
    )...
  }

  reducersOrSagas = (waitToCheck) =>

    if waitToCheck in (
      Object.keys _constants.reducers.types
    )
      'reducers'

    else if waitToCheck in (
      Object.keys _constants.reducers.actions
    )
      'reducers'

    else if _.sagas?

      if waitToCheck in (
        Object.keys _constants.sagas.types
      )
        'sagas'
      else if waitToCheck in (
        Object.keys _constants.sagas.actions
      )
        'sagas'

    else undefined

  _ = {
    _...
    {
      reducersOrSagas
    }...
  }

  constants = mergeActionsTypes _constants
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
