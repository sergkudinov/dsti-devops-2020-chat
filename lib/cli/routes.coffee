
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
    list: ({writer}) ->
      records = await users.list()
      writer.write "Users are:\n"
      for record in records
        writer.write "- username: #{JSON.stringify record.username}\n"
        writer.write "  email: #{JSON.stringify record.email}\n"
  channels:
    create: ({params, writer}) ->
      await channels.create params
      writer.write "Channel #{JSON.stringify params.name} is created.\n"
    exists: ({params, writer}) ->
      exists = await channels.exists params.id
      writer.write if exists
      then "Channel #{JSON.stringify params.id} exists.\n"
      else "Channel #{JSON.stringify params.id} does not exist.\n"
    list: ({writer}) ->
      records = await channels.list()
      writer.write "Channels are:\n"
      for record in records
        writer.write "- name: #{JSON.stringify record.name}\n"
        writer.write "  id: #{JSON.stringify record.id}\n"
        writer.write "  users:\n"
        for user in record.users
          writer.write "  - #{JSON.stringify user}\n"
        
