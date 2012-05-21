require 'ember-metal-node'
require 'ember-runtime-node'
require '../../../vendor/ember-data'

inflector = require 'inflect'
path = require 'path'

Ember = global.Ember
DS    = global.DS

Faye = DS.Adapter.extend
  currentSubscriptions: []

  init: (client)->
    @client = client

  createRecord: (store,type,model)->
    channel = @toChannel(model)
    @ensureSubscription(channel)

  toChannel: (recordOrModel)->
    if recordOrModel.isInstance
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

  ensureSubscription: (channel)->
    if @get('currentSubscriptions').indexOf(channel) == -1
      @client.subscribe channel, (message)->
        @processMessage(channel, message)

exports.Faye = Faye
