
channels = require '../lib/channels'
messages = require '../lib/messages'
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
    # Publish a message
    await messages.publish channel,
      message: 'my message'
    records = await messages.list channel
    records.length.should.equals 1
  
  it 'publish messages', ->
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
    # Publis a message
    await messages.publish channel,
      message: 'my message'
    await messages.publish channel,
      message: 'my message'
    records = await messages.list channel
    records.length.should.equals 2
