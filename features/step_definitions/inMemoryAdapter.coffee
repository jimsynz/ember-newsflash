path = require 'path'

inMemoryAdapterWrapper = ->

  @Given /^an ember app is loaded in the browser$/, (callback)->
    @visit("file://#{path.resolve '../../public/index.html'}", callback)

  @Given /^a document exists$/, (callback)->
    callback.pending()

  @Given /^a bunch of documents exist$/, (callback)->
    callback.pending()

  @Given /^a new document$/, (callback)->
    callback.pending()

  @Given /^a bunch of new documents$/, (callback)->
    callback.pending()

  @When /^I (.+) for (.+)$/, (callback)->
    callback.pending()

  @When /^I change (.+) data$/, (callback)->
    callback.pending()

  @When /^I (\w+) (\w+)$/, (callback)->
    callback.pending()

  @Then /^(\w+) should (.+)$/, (callback)->
    callback.pending()

module.exports = inMemoryAdapterWrapper
