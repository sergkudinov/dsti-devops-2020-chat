
channels = require '../lib/channels'
messages = require '../lib/messages'
users = require '../lib/users'

describe 'messages', ->
  
  it 'publish message', ->
    # Create our users
    user_1 = users.create
      username: 'user_1'
    user_2 = users.create
      username: 'user_2'
    # Create our channel
    channel = channels.create [
      user_1
      user_2
    ]
    # Publish a message
    messages.publish channel,
      message: 'my message'
    messages.list(channel).length.should.equals 1
  
  it 'publish messages', ->
    # Create our users
    user_1 = users.create
      username: 'user_1'
    user_2 = users.create
      username: 'user_2'
    # Create our channel
    channel = channels.create [
      user_1
      user_2
    ]
    # Publis a message
    messages.publish channel,
      message: 'my message'
    messages.publish channel,
      message: 'my message'
    messages.list(channel).length.should.equals 2
