
channels = require '../lib/channels'
users = require '../lib/users'

describe 'messages', ->
  
  it 'publish message', ->
    # Create our users
    user_1 = await users.create
      username: 'user_1'
    user_2 = await users.create
      username: 'user_2'
    # Create our channel
    channel = await channels.create [
      user_1
      user_2
    ]
    channels.exists(channel)
    .should.resolvedWith true
