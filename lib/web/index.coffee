
channels = require '../channels'
users = require '../users'
express = require 'express'
app = express()

app.get '/', (req, res) ->
  res.send """
  <h1>Welcome to the DSTI chat application.</h1>
  
  <p>Here are some REST API available:</p>
  <ul>
    <li><a href="/users/">List the users:</a></li>
    <li><a href="/channels/">List the channels</a></li>
  </ul>
  """

app.get '/users', (req, res) ->
  records = await users.list()
  res.json records

app.get '/channels', (req, res) ->
  records = await channels.list()
  res.json records

module.exports = app
