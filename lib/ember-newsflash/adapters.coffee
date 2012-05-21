require 'ember-metal-node'
require 'ember-runtime-node'

Ember = global.Ember

Faye = require('./adapters/faye').Faye

Adapters = Ember.Object.extend()
Adapters.Faye = Faye

exports.Adapters = Adapters
