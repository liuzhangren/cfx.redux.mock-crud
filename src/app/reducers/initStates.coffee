import business from '../../business'

baseInitState = 
  all: {}
  keys: []
  filter: {}

export default business.reduce (r, c) =>
  {
    r...
    "#{c}": baseInitState
  }
, {}