vows = require 'vows'
assert = require 'assert'
Newsflash = require('../../../../lib/ember-newsflash').Newsflash

Mock = Ember.Namespace.create
  toString: -> 'Mock'

Mock.Thing = DS.Model.extend
  name: DS.attr('string')

Mock.Store = Ember.Object.extend
  didCreateRecord: (data)->
    console.debug "didCreateRecord called"
    @get('callback')(data)

class MockClient
  constructor: (url)->
    console.log 'Fake initializer callback'
    @url = url
  subscribe: (channel)->
    callback: (m)->
      console.log 'Fake subscribe callback'
      m()
    errback: (m)->
  publish: (channel,data)->
    callback: (m)->
      console.log 'Fake publish callback'
      m()
    errback: (m)->

vows
  .describe('Newsflash.Adapters.Faye')
  .addBatch
    '#classToChannel':
      topic: ->
        faye = Newsflash.Adapters.Faye.create
          clientClass: MockClient
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
        adapter = Newsflash.Adapters.Faye.create()
        thing = Mock.Thing.create()
        thing.set 'name', 'a thing of great beauty'
        adapter.createRecord(store,Mock.Thing,thing)
        store = Mock.Store.create
          callback: @callback
        return undefined

      'topic is a thing': (data)->
        assert.equal data, 'a thing of great beauty'
        

  .export(module)
