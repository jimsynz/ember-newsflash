vows = require 'vows'
assert = require 'assert'
Newsflash = require('../../../lib/ember-newsflash').Newsflash

suite = vows.describe('Newsflash.Adapters')
suite.addBatch
  '.Memory':
    'exists': ->
      assert.notEqual(typeof(Newsflash.Adapters.Memory), 'undefined')

suite.export(module)

