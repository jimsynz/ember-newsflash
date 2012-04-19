require 'ember-metal'
require 'ember-runtime'

Adapters = require('./ember-newsflash/adapters').Adapters

Ember = global.Ember

Newsflash = Ember.Object.extend()
Newsflash.Adapters = Adapters

exports.Newsflash = Newsflash
