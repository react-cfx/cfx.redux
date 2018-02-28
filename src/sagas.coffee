# import dd from 'ddeyes'

import { sagaEffects } from 'cfx.redux-saga'

createSaga = ({
  everyOrLatest = 'every'
  sagaName
  saga
}) =>

  func = switch everyOrLatest
    when 'every'
    then sagaEffects.takeEvery
    when 'latest'
    then sagaEffects.takeLatest
    else sagaEffects.takeEvery

  ({ types }) => ->
    yield func sagaName
    ,
      saga { types }

promiseSaga = (
  saga
) =>
  ({ types }) => ( action = {} ) ->

    if action.payload?.success?
      {
        success
        failure
      } = yield from ( saga { types } ) action.payload
      if success?
        action.payload.success success
      else if action.payload?.failure?
        action.payload.failure failure

    else
      result = yield from ( saga { types } ) action

    result

toSaga = (
  sagasMap
) =>

  newSagas = (
    Object.keys sagasMap
  ).reduce (r, c) =>

    everyOrLatest = 'every'
    saga = sagasMap[c]

    if sagasMap[c].latest?
      everyOrLatest = 'latest'
      saga = sagasMap[c].latest
    else if sagasMap[c].every?
      saga = sagasMap[c].every

    {
      r...
      "#{c}": createSaga {
        everyOrLatest
        sagaName: c
        saga: promiseSaga saga
      }
    }

  , {}

mergeSagas = (
  sagaMap
) =>

  result = (
    Object.keys sagaMap
  ).reduce (r, c) =>

    (
      Object.keys sagaMap[c]
    ).reduce (_r, _c) =>

      sagas: [
        _r.sagas...
        (
          if typeof sagaMap[c][_c] is 'function'
          then [ sagaMap[c][_c] ]
          else []
        )...
      ]
      constants: {
        _r.constants...
        "#{_c}": _c
      }
    
    , r

  ,
    sagas: []
    constants: {}

  {
    result...
    sagas: ({ types }) =>
      result.sagas.reduce (r, c) =>
        [
          r...
          c { types }
        ]
      , []
  }

export {
  toSaga
  mergeSagas
}
