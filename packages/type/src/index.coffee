
underlineToHump = (name) ->
  words = name.split '_'
  words = words.reduce (result, key, index, array) ->
    if index is 0
      result.push key.toLowerCase()
    else
      keyArray = key.toLowerCase().split ''
      keyArray[0] = keyArray[0].toUpperCase()
      result.push keyArray.join ''
    result
  , []
  words.join ''

toActionsTypes = (typesObj) ->
  types = {}
  for k, v of typesObj
    types[k.toUpperCase()] = v.toUpperCase()
  typesObj = types
  r =
    types: typesObj
    actions: {}
  for type in Object.keys r.types
    r.actions[underlineToHump type] = type
  r

# TODO can use object params
mergeActionsTypes = ->
  actionsTypesArray = []
  if arguments.length is 1
    if Array.isArray arguments[0]
      actionsTypesArray = arguments[0]
    else if typeof arguments[0] is 'object'
      for k, v of arguments[0]
        actionsTypesArray.push v
    else return # TODO throw
  else
    actionsTypesArray = arguments

  actionsTypesArray
  .reduce (result, actionsTypes, index, array) ->
    actions: {
      result.actions...
      actionsTypes.actions...
    }
    types: {
      result.types...
      actionsTypes.types...
    }
  ,
    actions: {}
    types: {}

export {
  toActionsTypes
  mergeActionsTypes
}
