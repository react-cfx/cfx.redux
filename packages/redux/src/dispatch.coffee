# import dd from 'ddeyes'

handleFilter = (reducersOrSagas, type, handler) =>
  (
    Object.keys handler
  ).reduce (r, c) =>
    return r if c is type
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
  type
  {
    dispatch
    actions
  }
) =>
  dispatch: handleFilter reducersOrSagas, type, dispatch 
  actions: handleFilter reducersOrSagas, type, actions

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
  , type
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
