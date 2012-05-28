require 'ember-metal-node'
require 'ember-runtime-node'
require '../../../vendor/ember-data'
faye = require 'faye'

inflector = require 'inflect'
path = require 'path'

Ember = global.Ember
DS    = global.DS

Faye = DS.Adapter.extend
  currentSubscriptions: []
  url: 'http://localhost:8000/faye'
  clientClass: faye.Client
  client: (-> new @get('clientClass')(@get('url'))).property('url','clientClass').cacheable()

  createRecord: (store,type,model)->
    channel = @toChannel(model)
    @ensureSubscription channel, (error)->
      if error?
        console.log "Error subscribing to channel: #{channel}"
        console.log error
      else
        publication = @client.publish channel,
          action: 'create'
          attributes: model.data
        publication.callback ->
          store.didCreateRecord(model.data)
        publication.errback (error)->
          # FIXME no sad face path

  toChannel: (recordOrModel)->
    if recordOrModel.isInstance? && recordOrModel.isInstance
      path.join(
        @classToChannel(recordOrModel.constructor),
        recordOrModel.get(recordOrModel.get('primaryKey')).toString()
      )
    else
      @classToChannel(recordOrModel)
      
  classToChannel: (klass)->
    chunks = klass.toString().split('.').map (str)->
      inflector.pluralize(inflector.underscore(str))
    chunks[0] = "/#{chunks[0]}" unless chunks[0][0] == '/'
    path.join.apply(path.join, chunks)

  ensureSubscription: (channel, subscriptionResult)->
    if @get('currentSubscriptions').indexOf(channel) == -1
      subscription = @client.subscribe channel, (message)->
        @processMessage(channel, message)
      subscription.callback ->
        @get('currentSubscriptions').pushObject(subscription)
        subscriptionResult()
      subscription.errback (error)->
        subscriptionResult(error)

exports.Faye = Faye
