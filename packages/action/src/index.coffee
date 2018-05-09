import * as reduxActions from 'redux-actions'
# { createActions } = reduxActions

createActions = (config) =>
  actionMap = {}
  identityActions = []
  for k, v of config
    if typeof v is 'string'
    then identityActions.push v
    else actions[k] = v
  reduxActions.createActions.apply null, [
    actionMap
    identityActions...
  ]

export {
  reduxActions
  createActions
}
