
messages = {}

module.exports =
  publish: (channel, message) ->
    messages[channel.id] ?= []
    messages[channel.id].push message
  list: (channel) ->
    messages[channel.id]
    
