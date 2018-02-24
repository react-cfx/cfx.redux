import dd from 'ddeyes'
import {
  sagaEffects
} from 'cfx.redux-saga'

handleActions = (sagas) =>
  newSagas = (
    Object.keys sagas
  ).reduce (r, c) =>
    {
      r...
      "#{c}": (action = {}) ->
        if action.payload?.success?
          {
            success
            fault
          } = yield from sagas[c] action.payload.payload
          if success?
            action.payload.success success
          else if action.payload?.fault?
            action.payload.fault fault
        else
          result = yield from sagas[c] action
        result
    }
  , {}

checkTakeFunc = (takeStr = 'every') =>
  switch takeStr
    when 'every'
    then sagaEffects.takeEvery
    when 'latest'
    then sagaEffects.takeLatest
    else sagaEffects.takeEvery

merge = (
  sagaMap
  takeMap = {}
) =>
  (
    Object.keys sagaMap
  ).reduce (r, c) =>
    [
      r...
      ->
        yield (
          if takeMap[c]?
          then checkTakeFunc takeMap[c]
          else checkTakeFunc()
        ) c
        , sagaMap[c]
    ]
  , []

export {
  handleActions
  merge
}
