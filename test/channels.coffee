
channels = require '../lib/channels'
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
    channels.exists(channel).should.be.true()
