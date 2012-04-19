vows = require 'vows'
assert = require 'assert'
Newsflash = require('../../lib/ember-newsflash').Newsflash

suite = vows.describe('Newsflash')
suite.addBatch
  'exists': ->
    assert.notEqual(typeof(Newsflash), 'undefined')

  '.Adapters': {
    'exists': ->
      assert.notEqual(typeof(Newsflash.Adapters), 'undefined')
  }

suite.export(module)
