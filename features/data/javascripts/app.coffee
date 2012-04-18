require './jquery'
require 'ember'
require 'ember-data'

window.App = Ember.Applcation.create
  createInMemoryStore: ->
    window.App.store = DS.Store.create
      revision: 3
      adapter: Newsflash.Adapters.InMemoryAdapter.create()
    typeof(window.App.store)

  createDocumentModel: ->
    window.App.Thing = DS.Model.extend
      thingName: DS.attr('string')
    typeof(window.App.Thing)

  createADocumentAndReturnId: ->
    doc = App.store.createRecord App.Thing,
      thingName: 'A thing of great beauty'
    App.store.commit()
    return doc.get('id')
