
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
    await db.put "channels:#{channel.id}", JSON.stringify channel
    channel
  exists: (channel) ->
    !! await db.get "channels:#{channel.id}"
  list: () ->
    new Promise (resolve, reject) ->
      data = []
      db.createReadStream
        gt: "channels:"
        lte: "channels"+String.fromCharCode(":".charCodeAt(0) + 1)
      .on 'data', (record) ->
        value = JSON.parse record.value
        data.push value
      .on 'error', (err) ->
        reject err
      .on 'end', ->
        resolve data
    
