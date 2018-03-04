# import dd from 'ddeyes'

handleFilter = (reducersOrSagas, handler) =>
  (
    Object.keys handler
  ).reduce (r, c) =>
    switch reducersOrSagas c
      when 'reducers'
      then {
        r...
        reducers: {
          r.reducers...
          "#{c}": handler[c]
        }
      }
      when 'sagas'
      then {
        r...
        sagas: {
          r.sagas...
          "#{c}": handler[c]
        }
      }
      else r
  ,
    reducers: {}
    sagas: {}

filter = (
  reducersOrSagas
  {
    dispatch
    actions
  }
) =>
  dispatch: handleFilter reducersOrSagas, dispatch 
  actions: handleFilter reducersOrSagas, actions

filterType = (
  reducersOrSagas
  type
  {
    dispatch
    actions
  }
) =>

  if ( reducersOrSagas type ) is 'reducers'
    dispatch: dispatch.reducers
    actions: actions.reducers
  else
    dispatch: {
      dispatch.reducers...
      dispatch.sagas...
    }
    actions: {
      actions.reducers...
      actions.sagas...
    }

promiseWapper = ({
  action
}, {
  type
  store
  actions
  dispatch
  reducersOrSagas
}) =>

  {
    dispatch
    actions
  } = filter reducersOrSagas
  , {
    dispatch
    actions
  }

  ( payload = {}) =>

    {
      dispatch 
      actions
    } = filterType reducersOrSagas, type
    , {
      dispatch
      actions
    }

    new Promise (resolve, reject) =>

      store.dispatch action {

        payload

        helper: {
          store
          dispatch
          actions
        }

        success: (data) =>
          resolve data
        failure: (error) =>
          reject error
      }

export default ({
  store
  actions
  reducersOrSagas
}) =>

  (
    Object.keys actions
  ).reduce (r, c) =>
    {
      r...
      "#{c}": ({
        payload
        dispatch
      }) => (
        promiseWapper
          action: actions[c]
        , {
          type: c
          actions
          store
          dispatch
          reducersOrSagas
        }
      ) payload
    }
  , {}
