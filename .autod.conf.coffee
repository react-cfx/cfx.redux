export default
  write: true
  registry: 'https://registry.npm.taobao.org'
  prefix: '~'
  devprefix: '^'
  plugin: ''
  test: []
  dep: []
  devdep: [
    'autod'
    'lerna'
    'cfx.require-plugin-coffee'
  ]
  exclude: [
    './packages'
    './node_modules'
    './.autod.conf.js'
  ]
