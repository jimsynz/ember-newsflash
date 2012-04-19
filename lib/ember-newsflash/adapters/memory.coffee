require 'ember-metal'
require 'ember-runtime'
require 'ember-data'

Ember = global.Ember
DS    = global.DS

Memory = DS.Adapter.extend()

exports.Memory = Memory
