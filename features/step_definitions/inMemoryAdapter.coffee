inMemoryAdapterWrapper = ->

  @World = require('../support/world').World

  @Given /^an ember app is loaded in the browser$/, (callback)->
    uri = "file://#{@fixtures}/index.html"
    @visit uri, (success)=>
      if success 
        @browser.evaluate (-> typeof(window.App)), (result) ->
          if result == 'undefined'
            callback.fail "Ember Application not loaded"
          else
            callback()
      else
        callback.fail "Couldn't load site"

  @Given /^the (.+) store is loaded$/, (store_type, callback)->
    if store_type == 'in memory'
      @browser.evaluate (-> typeof(window.App.createInMemoryStore())), (result)->
        if result?
          callback()
        else
          callback.fail("Failed to create in memory document store")

  @Given /^there is a document model defined$/, (callback)->
    @browser.evaluate (-> typeof(window.App.createDocumentModel())), (result)->
      if result? 
        callback()
      else
        callback.fail("Failed to define the document model.")

  @Given /^a document exists$/, (callback)->
    @browser.evaluate (-> typeof(window.App.createADocumentAndReturnId())), (result)->
      if result?
        console.log(result)
        @document_id = result
        callback()
      else
        callback.fail("Failed to create document.")

  @Given /^a bunch of documents exist$/, (callback)->
    callback.pending()

  @Given /^a new document$/, (callback)->
    callback.pending()

  @Given /^a bunch of new documents$/, (callback)->
    callback.pending()

  @When /^I (.+) for (.+)$/, (action,what,callback)->
    #if (action == 'ask') && (what == 'it by id')
    callback.pending()

  @When /^I change (.+) data$/, (callback)->
    callback.pending()

  @When /^I (\w+) (\w+)$/, (callback)->
    callback.pending()

  @Then /^(\w+) should (.+)$/, (callback)->
    callback.pending()

module.exports = inMemoryAdapterWrapper
