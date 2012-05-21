require 'ember-metal-node'
require 'ember-runtime-node'

Ember = global.Ember

Memory = require('./adapters/memory').Memory

Adapters = Ember.Object.extend()
Adapters.Memory = Memory

exports.Adapters = Adapters
