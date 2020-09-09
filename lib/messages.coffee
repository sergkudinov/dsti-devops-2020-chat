
db = require './db'
now = require 'nano-time'

module.exports =
  publish: (channel, message) ->
    time = Date.now()
    await db.put "messages:#{channel.id}:#{time}:#{now.micro()}", JSON.stringify message
  list: (channel) ->
    new Promise (resolve, reject) ->
      data = []
      db.createReadStream
        gt: "messages:#{channel.id}"
        lte: "messages:#{channel.id}zzz"
      .on 'data', (record) ->
        value = JSON.parse record.value
        value.key = record.key
        data.push value
      .on 'error', (err) ->
        reject err
      .on 'end', ->
        resolve data
    
