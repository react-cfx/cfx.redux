import dd from 'ddeyes'
import { reduxActions } from 'cfx.redux-actions'
# import SI from 'cfx.seamless-immutable'
# "cfx.seamless-immutable": "^0.0.1",

handleActions = (reduces, initializations) =>

  newReduces = (
    Object.keys reduces
  ).reduce (r, c) =>
    {
      r...
      "#{c}": (state, action = {}) =>
        if action.payload?.success? 
          newState = reduces[c] state
          , payload: action.payload.payload
          action.payload.success newState
        else
          newState = reduces[c] state, action
        newState
    }
  , {}

  reduxActions.handleActions newReduces, initializations

merge = (
  reduceMap
  defaultState
  # options
) =>

  unless defaultState
    throw new Error 'must be provided a default state.'

  (
    state = defaultState
    action
  ) =>

    # isImmutable =
    #   unless options?.immutable?
    #   then true # default true
    #   else
    #     if options.immutable is false
    #     then false else true

    # state = SI.new state if isImmutable

    (
      Object.keys reduceMap
    ).reduce (r, reduceName) => 
      _reduce = reduceMap[reduceName]
      {
        r...
        "#{reduceName}": _reduce state[reduceName], action
      }
    , {}


export {
  handleActions
  merge
}
