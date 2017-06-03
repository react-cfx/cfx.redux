redux = require 'redux'
{
  createStore
  applyMiddleware
  combineReducers
} = redux
SI = require 'cfx.seamless-immutable'

CreateStore = (reducers, pluginList = []) ->
  createStore(
    combineReducers reducers
    applyMiddleware.apply @, pluginList
  )

mergeReduce = (
  reduceMap
  defaultState
  options
) ->

  unless defaultState
    throw new Error 'must be provided a default state.'

  (state = defaultState, action) ->

    isImmutable =
      unless options?.immutable?
      then true # default true
      else
        if options.immutable is false
        then false else true

    state = SI.new state if isImmutable

    r = {}
    for reduceName, reduce of reduceMap
      r[reduceName] = reduce state[reduceName], action
    r

module.exports = {
  redux
  createStore: CreateStore
  mergeReduce
}
