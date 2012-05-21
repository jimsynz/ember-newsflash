vows = require 'vows'
assert = require 'assert'
Newsflash = require('../../../../lib/ember-newsflash').Newsflash

Mock = Ember.Namespace.create()

Mock.Thing = DS.Model.extend
  name: DS.attr('string')

Mock.Store = Ember.Object.extend
  didCreateRecord: (data)->
    console.debug "didCreateRecord called"
    @get('callback')(data)

vows
  .describe('Newsflash.Adapters.Faye')
  .addBatch
    '#classToChannel':
      topic: ->
        faye = Newsflash.Adapters.Faye.create()
        faye.classToChannel(Mock.Thing)
      'returns a path': (topic)->
        assert.equal topic, '/mocks/things'

    '#toChannel(modelClass)':
      topic: ->
        faye = Newsflash.Adapters.Faye.create()
        faye.toChannel(Mock.Thing)
      'returns a path': (topic)->
        assert.equal topic, '/mocks/things'

    '#toChannel(modelInstance)': 
      topic: ->
        faye = Newsflash.Adapters.Faye.create()
        faye.toChannel(Mock.Thing.create(id: 1))
      'returns a path': (topic)->
        assert.equal topic, '/mocks/things/1'

    '#createRecord': 
      topic: ->
        thing = Mock.Thing.create()
        thing.set 'name', 'a thing of great beauty'
        store = Mock.Store.create
          callback: @callback
        adapter = Newsflash.Adapters.Faye.create()
        adapter.createRecord(store,Mock.Thing,thing)
        return undefined

      'topic is a thing': (thing,data)->
        console.warn data
        #assert.equal thing.get('name'), 'a thing of great beauty'
        

  .export(module)
