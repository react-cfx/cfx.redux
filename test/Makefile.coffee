import dd from 'ddeyes'
import 'shelljs/make'

import {
  reducers 
  sagas
  createRedux
  createStore
  createApp
} from './tasks'

target.all = =>
  dd 'Hello World!!!'

target.reducers = => reducers()
target.sagas = => sagas()

target.createRedux = => createRedux()
target.createStore = => createStore()
target.createApp = => createApp()
