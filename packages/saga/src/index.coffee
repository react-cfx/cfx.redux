import createSagaMiddleware from 'redux-saga'
import * as sagaEffects from 'redux-saga/effects'

class SagaMiddleware
  constructor: ->
    @middleware = createSagaMiddleware()
    @

  getMidleware: -> @middleware

  runSagas: (sagas) ->
    for saga in sagas
      @middleware.run saga

# createSagaMiddleware = (sagas) ->
#   sagaDefault.apply @, sagas

dispatch = (action, actionType) ->
  sagaEffects.put Object.assign {}
  , action
  , type: actionType

export {
  sagaEffects
  dispatch
  createSagaMiddleware
  SagaMiddleware
}
