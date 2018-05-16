export default
  write: true
  registry: 'https://registry.npm.taobao.org'
  prefix: '~'
  devprefix: '^'
  plugin: ''
  test: []
  dep: [
    'cfx.redux.action'
    'cfx.redux.sagas'
    'cfx.redux.type'
    'cfx.require-plugin-coffee'
    'cfx.rollup-plugin-coffee2'
    'del'
    'gulp'
    'gulp-better-rollup'
    'gulp-rename'
    'gulp-sequence'
    'redux'
    'redux-on-state-change'
    'rollup'
    'rollup-plugin-cleanup'
  ]
  devdep: [
    'autod'
    'ddeyes'
    'shelljs'
  ]
  semver: [
    'redux@3'
  ]
  exclude: [
    './node_modules'
    './.autod.conf.js'
  ]
