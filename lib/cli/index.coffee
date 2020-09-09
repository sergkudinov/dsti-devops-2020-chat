
parameters = require 'parameters'
params = require './params'

app = parameters params
try
  app.route()
catch
  app.help()
