
{ v4: uuid } = require 'uuid'

channels = {}

module.exports =
  create: (users) ->
    channel_id = uuid()
    channel =
      id: channel_id
      users: users
        .map (user) -> user.username
        .sort()
      messages: []
    channels[channel.id] = channel
    channel
  exists: (channel) ->
    !!channels[channel.id]
    
