import business from '../../business'
import { toReducer } from 'cfx.redux.redux'
import total from './base/four'
import initStates from './initStates'

export default business.reduce (r, c) =>
  {
    r...
    "#{c}": toReducer (total c), initStates[c]
  }
, {}