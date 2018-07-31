import connect from './connect'

export default (app) => 

  getActionName = (type) =>

    { actions } = app._.constants

    (
      Object.keys actions
    )
    .reduce (r, c) =>
      return r unless r is ''
      if actions[c] is type
      then c
      else r
    , ''

  bindActionCreators = (
    actions
    dispatch
  ) =>

    (
      Object.keys actions
    )
    .reduce (r, c) =>

      {
        r...
        "#{c}": (payload) =>
          action = actions[c] payload
          actionName = getActionName action.type
          await dispatch[actionName] payload
      }
    , {}

  connect bindActionCreators, app.dispatch
