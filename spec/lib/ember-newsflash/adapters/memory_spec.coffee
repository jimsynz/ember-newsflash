vows = require 'vows'
assert = require 'assert'
Newsflash = require('../../../../lib/ember-newsflash').Newsflash

Thing = DS.Model.extend
  name:        DS.attr('string')
  description: DS.attr('string')

MockStore = Ember.Object.extend
  didCreateRecord: (model,data)->
    console.debug "didCreateRecord called"
    @get('callback')(model,data)

vows
  .describe('Newsflash.Adapters.Memory')
  .addBatch
    '#createRecord': 
      topic: ->
        thing = Thing.create
        thing.set 'name', 'a thing of great beauty'
        store = MockStore.create
          callback: @callback
        adapter = Newsflash.Adapters.Memory.create()
        adapter.createRecord(store,Thing,thing)
        return undefined

      'topic is a thing': (thing,data)->
        assert.equal thing.get('name'), 'a thing of great beauty'
        

  .export(module)
