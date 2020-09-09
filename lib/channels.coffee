
{ v4: uuid } = require 'uuid'

db = require './db'

module.exports =
  create: (users) ->
    channel_id = uuid()
    channel =
      id: channel_id
      users: users
        .map (user) -> user.username
        .sort()
    await db.put "channels:#{channel.id}", channel
    channel
  exists: (channel) ->
    !! await db.get "channels:#{channel.id}"
    
