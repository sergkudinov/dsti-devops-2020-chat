
db = require './db'

module.exports =
  create: (user) ->
    username = user.username
    record = {}
    for key, value of user
      continue if key is username
      record[key] = value
    await db.put "users:#{username}", username
    user
  exists: (user) ->
    username = if typeof user is 'string'
    then user
    else user.username
    user = await db.get "users:#{username}"
    !!user
    # !!users[username]
