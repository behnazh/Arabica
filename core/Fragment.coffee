fs = require 'fs'
jsdom = require 'jsdom'

jsOpt =
  features :
    QuerySelector : true

exports.load = (filename, callback) ->
  fs.readFile(filename, 'ascii', (errors, file) ->
    if errors
      callback errors
    else
      dom = jsdom.jsdom(file, null, jsOpt)

      frag = getFragment(dom)

      processFragment(frag)

      callback(null, dom.outerHTML)
  )

processFragment = (frag) ->
  controllerName = getControllerName(frag)
  actionName = getActionName(frag)
  controller = getController(controllerName)
  results = controller[actionName](frag)

  frag.innerHTML = getHtml(results)
  frag


getHtml = (dom) ->
  dom.parentNode.innerHTML

getController = (controllerName) ->
  require(process.cwd() + '/app/controllers/'+controllerName+'.coffee')

createElement = () ->
  doc.createElement('div')

getFragment = (dom) ->
  dom.querySelector('[controller]')

getFragments = (dom) ->
  dom.querySelectorAll('[controller]')

getControllerName = (fragment) ->
  fragment.getAttribute('controller')

getActionName = (fragment) ->
  fragment.getAttribute('action')

