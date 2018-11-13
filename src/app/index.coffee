import { createApp } from 'cfx.redux.redux'
import reducers from './reducers/reducers'

export default =>
  createApp {
    reducers
  }