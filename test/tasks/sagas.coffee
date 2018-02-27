import dd from 'ddeyes'
import sagasObj from '../counter/sagas'
import { mergeSagas } from '../../src/sagas'

export default =>

  dd
    sagasObj:
      count: Object.keys sagasObj.count

  sagas = mergeSagas sagasObj

  dd { sagas }

  sagas
