http = require('http')
loader = require('./core/Fragment')


server = http.createServer (req, res) ->
  loader.load('templates/index.html', (errrors, document) ->
    res.writeHead(200, { 'Content-Type', 'text/html' })
    res.end(document)
  )
server.listen 8080


