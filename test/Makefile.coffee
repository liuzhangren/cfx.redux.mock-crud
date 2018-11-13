import dd from 'ddeyes'
import 'shelljs/make'
import app from '../src'

appConfig = app()

target.all = =>
  dd 'hello world'
  dd Object.keys appConfig.dispatch

    
    
target.test = =>
  appConfig.dispatch.personSave
    objectId: '001'
    name: '张三'
    age: '20'
    sex: '男'

  appConfig.dispatch.personSave
    objectId: '002'
    name: '李四'
    age: '21'
    sex: '男'
  appConfig.dispatch.personSave
    objectId: '003'
    name: '王朝'
    age: '21'
    sex: '男'
  appConfig.dispatch.personPatch
    objectId: '002'
    name: 'Tom'
    age: '10'
    sex: '男'
  dd appConfig.store.getState()