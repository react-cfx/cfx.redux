import dd from 'ddeyes'
import createRedux from '../../src/createRedux'
import reducersObj from '../counter/reducers'

export default =>

  redux = createRedux
    reducers: reducersObj

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
