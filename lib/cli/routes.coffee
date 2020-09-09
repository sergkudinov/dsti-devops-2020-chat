
channels = require '../channels'
users = require '../users'

module.exports =
  users:
    create: ({params, writer}) ->
      await users.create params
      writer.write "User #{JSON.stringify params.username} is created.\n"
    exists: ({params, writer}) ->
      exists = await users.exists params.username
      writer.write if exists
      then "User #{JSON.stringify params.username} exists.\n"
      else "User #{JSON.stringify params.username} does not exist.\n"
        
