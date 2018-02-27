import dd from 'ddeyes'
import {
  reducers as reducersObj
} from '../counter'

# import { mergeReducers } from '../../src'
import { mergeReducers } from '../../dist/bundle'

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
