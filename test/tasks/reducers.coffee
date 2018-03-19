import dd from 'ddeyes'
import {
  reducers as reducersObj
} from '../counter'

import { mergeReducers } from './cfxRedux'

export default =>

  dd { reducersObj }

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
    mergeReducers: reducers

  reducers
