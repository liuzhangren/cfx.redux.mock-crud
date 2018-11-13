import dd from 'ddeyes'

export default (
  state
  {
    payload
  }
) =>
  {
    objectId
    other...
  } = payload

  if objectId?
    res = (Object.keys state.all).reduce (r, c) =>
      {
        r...
        (
          if c is objectId
          then  {"#{c}": other}
          else {"#{c}": state.all[c]}
        )...
      }
    ,{}
    
    {
      all: res
      keys: state.keys
      filter: state.filter
    }
  else
    dd '请传入objectId'