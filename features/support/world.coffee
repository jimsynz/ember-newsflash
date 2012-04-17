zombie = require 'zombie'

exports.World = (callback)->
  world = 
    browser: new zombie.Browser()
    visit: (url,callback)->
      @browser.visit(url,callback)

  callback(world)

