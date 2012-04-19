require 'ember-metal'
require 'ember-runtime'

Ember = global.Ember

Memory = require('./adapters/memory').Memory

Adapters = Ember.Object.extend()
exports.Adapters = Adapters
