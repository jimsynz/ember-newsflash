inMemoryAdapterWrapper = ->
  @Given /^a document exists$/, (callback)->
    callback.pending()

module.exports = inMemoryAdapterWrapper
