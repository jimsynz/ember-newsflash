phantom = require 'phantom'
path    = require 'path'

class World
  constructor: (callback)->
    @root     = path.resolve(__dirname, '../../')
    @lib      = path.resolve(@root, 'lib')
    @fixtures = path.resolve(@root, 'spec/fixtures/html')

    @create_browser callback

  create_browser: (callback)->
    phantom.create (ph)=>
      ph.createPage (page)=>
        @browser = page
        page.onConsoleMessage = (msg)-> console.log(msg)
        callback()

  visit: (url,callback)->
    @browser.open url, callback

exports.World = World
