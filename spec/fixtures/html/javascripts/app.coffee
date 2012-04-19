require './jquery'
require './ember'
require './ember-data'

Ember = window.Ember
DS    = window.DS

window.App = Ember.Application.create
  createInMemoryStore: ->
    window.App.store = DS.Store.create
      revision: 3
      adapter: Newsflash.Adapters.InMemoryAdapter.create()
    window.App.store

  createDocumentModel: ->
    window.App.Thing = DS.Model.extend
      thingName: DS.attr('string')
    window.App.Thing

  createADocumentAndReturnId: ->
    doc = App.store.createRecord App.Thing,
      thingName: 'A thing of great beauty'
    App.store.commit()
    doc.get('id')
