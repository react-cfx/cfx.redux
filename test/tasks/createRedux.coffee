import dd from 'ddeyes'
import {
  reducers as reducersObj
  sagas as sagasObj
} from '../counter'

# import { createRedux } from '../../src'
import { createRedux } from '../../dist/bundle'

export default =>

  redux = createRedux
    reducers: reducersObj
    sagas: sagasObj

  {
    constants
    types
    actions
    initStates
    reducers
    sagas
    _
  } = redux

  dd {
    constants
    types
    actions: Object.keys actions
    initStates
    reducers: typeof reducers
    sagas
    _
  }

  redux
