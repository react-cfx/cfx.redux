promiseWapper = ({
  store
  action
}) =>

  ( actionParams = {} ) =>

    new Promise (resolve, reject) =>
      store.dispatch action {
        actionParams...
        success: (data) =>
          resolve data
        failure: (error) =>
          reject error
      }

export default ({
  store
  actions
}) =>

  (
    Object.keys actions
  ).reduce (r, c) =>
    {
      r...
      "#{c}":
        promiseWapper {
          store
          action: actions[c]
        }
    }
  , {}
