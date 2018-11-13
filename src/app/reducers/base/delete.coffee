import dd from 'ddeyes'

export default (
  state
  {
    payload: {
      objectId
    }
  }
) =>
  delete state.all[objectId]
  
  other = []
  
  state.keys.forEach (item) =>
    other.push item unless item is objectId

  {
    all: state.all
    keys: other
    filter: {}
  }