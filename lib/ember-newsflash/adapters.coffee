require 'ember-metal'
require 'ember-runtime'

Ember = global.Ember

Memory = require('./adapters/memory').Memory

Adapters = Ember.Object.extend()
Adapters.Memory = Memory

exports.Adapters = Adapters
