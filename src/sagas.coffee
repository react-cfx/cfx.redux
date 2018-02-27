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

  -> yield func sagaName, saga

promiseSaga = (saga) =>

  (action = {}) ->

    if action.payload?.success?
      {
        success
        fault
      } = yield from saga action.payload.payload
      if success?
        action.payload.success success
      else if action.payload?.fault?
        action.payload.fault fault

    else
      result = yield from saga action

    result

toSagas = (
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
  (
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

export {
  toSagas
  mergeSagas
}
