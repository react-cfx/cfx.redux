'use strict';

var CreateStore, SI, applyMiddleware, combineReducers, createStore, mergeReduce, redux;

redux = require('redux');

var _redux = redux;
createStore = _redux.createStore;
applyMiddleware = _redux.applyMiddleware;
combineReducers = _redux.combineReducers;


SI = require('cfx.seamless-immutable');

CreateStore = function CreateStore(reducers) {
  var pluginList = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : [];

  return createStore(combineReducers(reducers), applyMiddleware.apply(this, pluginList));
};

mergeReduce = function mergeReduce(reduceMap, defaultState, options) {
  if (!defaultState) {
    throw new Error('must be provided a default state.');
  }
  return function () {
    var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : defaultState;
    var action = arguments[1];

    var isImmutable, r, reduce, reduceName;
    isImmutable = (options != null ? options.immutable : void 0) == null ? true : options.immutable === false ? false : true;
    if (isImmutable) {
      state = SI.new(state);
    }
    r = {};
    for (reduceName in reduceMap) {
      reduce = reduceMap[reduceName];
      r[reduceName] = reduce(state[reduceName], action);
    }
    return r;
  };
};

module.exports = {
  redux: redux,
  createStore: CreateStore,
  mergeReduce: mergeReduce
};

