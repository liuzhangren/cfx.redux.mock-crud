import dd from 'ddeyes'
import Base from './index'

export default (name) =>
  (
    Object.keys Base
  ).reduce (r, c) =>
    {
      r...
      "#{name.toUpperCase()}_#{c.toUpperCase()}": Base[c]
    }
  , {}