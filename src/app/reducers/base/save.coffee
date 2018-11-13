import dd from 'ddeyes'

export default (
  state
  {
    payload
  }
) =>
  if payload.hasOwnProperty 'objectId'
    {
      objectId
      _payload...
    } = payload

    {
      all: {
        state.all...
        "#{objectId}": _payload
      }
      keys: [
        state.keys...
        objectId
      ]
      filter: {}
    }
  else
    if (Object.keys state.all).length > 0
      {
        all: [
          state.all
          payload
        ]
        keys: []
        filter: {}
      }
    else
      {
        all: payload
        keys: []
        filter: {}
      }
