# import dd from 'ddeyes'

import { combineReducers } from 'redux'
import { reduxActions } from 'cfx.redux.action'

handleActions = (
  reducers
  initState
) =>

  newReduces = (
    Object.keys reducers
  ).reduce (r, c) =>
    {
      r...
      "#{c}": (state, action = {}) =>

        if action.payload?.payload?
        
          newAction =
            type: action.type
            payload: action.payload.payload

          newState = reducers[c] state, newAction
          , action.payload.helper

          if action.payload.success?
            action.payload.success newState

        else

          newState = reducers[c] state, action

        newState
    }
  , {}

  reduxActions.handleActions newReduces, initState

toReducer = (
  reducer
  initState
) => {
  reducer
  initState
}

mergeReducers = (
  reduceMap 
) =>

  result = (
    Object.keys reduceMap
  ).reduce (r, c, i, a) =>

    if reduceMap[c]?.reducer? and (
      typeof reduceMap[c]?.reducer is 'object'
    )

    then (

      reducers: {
        r.reducers...
        "#{c}":
          handleActions reduceMap[c].reducer
          , reduceMap[c].initState
      }

      initStates: {
        r.initStates...
        "#{c}": reduceMap[c].initState
      }

      constants: {
        r.constants...
        (
          (
            Object.keys reduceMap[c].reducer
          ).reduce (_r, _c) =>
            {
              _r...
              "#{_c}": _c
            }
          , {}
        )...
      }
    )

    else (

      _mergedObj = mergeReducers reduceMap[c]

      reducers: {
        r.reducers...
        "#{c}": _mergedObj.reducers
      }

      initStates: {
        r.initStates...
        "#{c}": _mergedObj.initStates
      }

      constants: {
        r.constants...
        _mergedObj.constants...
      }

    ) 
  ,
    reducers: {}
    initStates: {}
    constants: {}

  {
    result...
    reducers: combineReducers result.reducers
  }

export {
  toReducer
  mergeReducers
}

# valuesOfObj = (Obj) =>
#   (
#     Object.keys Obj
#   ).reduce (r, c) =>
#     [
#       r...
#       Obj[c]
#     ]
#   , []

# import SI from 'cfx.seamless-immutable'
# "cfx.seamless-immutable": "^0.0.1",
#
# _merge = (
#   reduceMap
#   defaultState
#   # options
# ) =>

#   unless defaultState
#     throw new Error 'must be provided a default state.'

#   (
#     state = defaultState
#     action
#   ) =>

#     # isImmutable =
#     #   unless options?.immutable?
#     #   then true # default true
#     #   else
#     #     if options.immutable is false
#     #     then false else true

#     # state = SI.new state if isImmutable

#     (
#       Object.keys reduceMap
#     ).reduce (r, reduceName) => 
#       _reduce = reduceMap[reduceName]
#       {
#         r...
#         "#{reduceName}": _reduce state[reduceName], action
#       }
#     , {
