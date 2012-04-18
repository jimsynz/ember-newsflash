phantom = require 'phantom'
express = require 'express'
path    = require 'path'

class World
  constructor: (callback)->
    @root = path.resolve(__dirname, '../../')
    @lib  = path.resolve(@root, 'lib')
    @data = path.resolve(@root, 'features/data')

    @create_server =>
      @create_browser callback

  create_server: (callback)->
    @server = express.createServer()
    @server.listen 9797

    browserify = require 'browserify'
    app_js     = path.resolve(@data, 'javascripts/app.coffee')
    bundle     = browserify(app_js)
    @server.use bundle

    callback()

  create_browser: (callback)->
    phantom.create (ph)=>
      ph.createPage (page)=>
        @browser = page
        page.onConsoleMessage = (msg)-> console.log(msg)
        callback()

  visit: (url,callback)->
    @browser.open url, callback

exports.World = World
