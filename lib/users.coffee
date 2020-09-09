
db = require './db'

module.exports =
  create: (user) ->
    username = user.username
    record = {}
    for key, value of user
      continue if key is username
      record[key] = value
    await db.put "users:#{username}", JSON.stringify record
    user
  exists: (user) ->
    username = if typeof user is 'string'
    then user
    else user.username
    user = await db.get "users:#{username}"
    !!user
  list: () ->
    new Promise (resolve, reject) ->
      data = []
      db.createReadStream
        gt: "users:"
        lte: "users"+String.fromCharCode(":".charCodeAt(0) + 1)
      .on 'data', (record) ->
        value = JSON.parse record.value
        value.username = record.key
        data.push value
      .on 'error', (err) ->
        reject err
      .on 'end', ->
        resolve data
