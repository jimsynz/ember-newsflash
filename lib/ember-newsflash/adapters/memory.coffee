require 'ember-metal-node'
require 'ember-runtime-node'
require '../../../vendor/ember-data'

Ember = global.Ember
DS    = global.DS

Memory = DS.Adapter.extend
  init: ->
    @storage = {}
  createRecord: (store,type,model)->
    @storage[type] ||= {}
    data = model.get('data')
    @storage[type][model.get('primaryKey')] = data
    store.didCreateRecord(model,data)

exports.Memory = Memory
