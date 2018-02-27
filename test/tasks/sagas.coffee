import dd from 'ddeyes'
import {
  sagas as sagasObj
} from '../counter'
import { mergeSagas } from '../../src/sagas'

export default =>

  dd
    sagasObj:
      count: Object.keys sagasObj.count

  sagas = mergeSagas sagasObj

  dd { sagas }

  sagas
