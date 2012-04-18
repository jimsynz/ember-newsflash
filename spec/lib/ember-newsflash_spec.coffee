vows = require 'vows'
assert = require 'assert'

suite = vows.describe('Newsflash')
suite.addBatch
  'it should exist': (callback)->
    assert.notEqual(typeof(window.Newsflash), undefined)

suite.export(module)
