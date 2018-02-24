promiseWrapper = ({
  store
  action
}) =>

  ( actionParams = {} ) =>

    new Promise (resolve, reject) =>
      store.dispatch action {
        actionParams...
        success: (data) =>
          resolve data
        fail: (error) =>
          reject error
      }

# interfaceConfig = (
#   funcs
#   {
#     store
#     actions
#   }
# ) =>
#   (Object.keys funcs)
#   .reduce (r, c) =>
#     {
#       r...
#       "#{c}": (
#         args...
#       ) =>
#         funcs["#{c}"].apply null
#         , [
#           args...
#           {
#             store
#             actions
#           }
#         ]
#     }
#   , {}

export {
  promiseWrapper
  # interfaceConfig
}
