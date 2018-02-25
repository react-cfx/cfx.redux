# import dd from 'ddeyes'
import { combineReducers } from 'redux'
import { reduxActions } from 'cfx.redux-actions'

handleActions = (reducers, initState) =>

  newReduces = (
    Object.keys reducers
  ).reduce (r, c) =>
    {
      r...
      "#{c}": (state, action = {}) =>
        if action.payload?.success? 
          newState = reducers[c] state
          , payload: action.payload.payload
          action.payload.success newState
        else
          newState = reducers[c] state, action
        newState
    }
  , {}

  reduxActions.handleActions newReduces, initState

handleReducer = (
  reducer
  initState
) =>
  {
    reducer
    initState
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

mergeReducer = (
  reduceMap 
) =>
  (
    Object.keys reduceMap
  ).reduce (r, c, i, a) =>

    if reduceMap[c]?.reducer? and (
      typeof reduceMap[c]?.reducer is 'object'
    )

    then (

      # _c = handleActions reduceMap[c].reducer
      # , reduceMap[c].initState

      _reducers = {
        r.reducer...
        "#{c}":
          handleActions reduceMap[c].reducer
          , reduceMap[c].initState
      }

      {
        reducer:
          if a.length is (i + 1)
          then combineReducers _reducers
          else _reducers
        initState: {
          r.initState...
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
      }
    )

    else (
      _mergedObj = mergeReducer reduceMap[c]
      {
        reducer: {
          r.reducer...
          "#{c}": _mergedObj.reducer
        }
        initState: {
          r.initState...
          "#{c}": _mergedObj.initState
        }
        constants: r.constants
      }
    ) 
  ,
    reducer: {}
    initState: {}
    constants: {}

export {
  handleReducer
  mergeReducer
}

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
