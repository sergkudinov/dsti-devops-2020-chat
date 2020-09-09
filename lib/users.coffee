
users = {}

module.exports =
  create: (user) ->
    username = user.username
    users[username] = {}
    for key, value of user
      continue if key is username
      users[username][key] = value
    user
  exists: (user) ->
    username = if typeof user is 'string'
    then user
    else user.username
    !!users[username]
