import dd from 'ddeyes'
import reducersObj from '../counter/reducers'
import { mergeReducers } from '../../src/reducers'

export default =>

  dd
    reducersObj: {
      reducersObj...
      count: {
        reducersObj.count...
        reducer: Object.keys reducersObj.count.reducer
      }
    }

  reducers = mergeReducers reducersObj

  dd
    mergeReducers: {
      reducers...
      reducers: typeof reducers.reducers
    }

  reducers
