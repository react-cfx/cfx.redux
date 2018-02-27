import dd from 'ddeyes'
import 'shelljs/make'

import reducers from './tasks/reducers'
import sagas from './tasks/sagas'
import createRedux from './tasks/createRedux'
import createStore from './tasks/createStore'
import createApp from './tasks/createApp'

target.all = =>
  dd 'Hello World!!!'

target.reducers = => reducers()
target.sagas = => sagas()

target.createRedux = => createRedux()
target.createStore = => createStore()
target.createApp = => createApp()
