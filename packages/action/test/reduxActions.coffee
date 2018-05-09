import 'shelljs/make'
import dd from 'ddeyes'

import { toActionsTypes } from 'cfx.redux.type'
import { createActions } from '../src'

target.all = ->

  { actions } = toActionsTypes {
    'HELLO_WORLD'
  }

  dd actions

  dd Object.keys createActions actions

  { helloWorld } = createActions actions

  dd helloWorld 'cfx'
