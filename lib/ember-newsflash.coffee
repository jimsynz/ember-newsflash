require 'ember-metal-node'
require 'ember-runtime-node'

Adapters = require('./ember-newsflash/adapters').Adapters

Ember = global.Ember

Newsflash = Ember.Object.extend()
Newsflash.Adapters = Adapters

exports.Newsflash = Newsflash
