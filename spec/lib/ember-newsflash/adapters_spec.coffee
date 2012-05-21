vows = require 'vows'
assert = require 'assert'
Newsflash = require('../../../lib/ember-newsflash').Newsflash

suite = vows.describe('Newsflash.Adapters')
suite.addBatch
  '.Faye':
    'exists': ->
      assert.notEqual(typeof(Newsflash.Adapters.Faye), 'undefined')

suite.export(module)

