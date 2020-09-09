
require './test'
channels = require '../lib/channels'
users = require '../lib/users'

describe 'channels', ->
  
  it 'create', ->
    # Create our users
    user_1 = await users.create
      username: 'user_1'
    user_2 = await users.create
      username: 'user_2'
    # Create our channel
    channel = await channels.create
      name: 'channel_1'
      users: [
        user_1
        user_2
      ]
    # Check if channel exists
    channels.exists(channel)
    .should.resolvedWith true
      
  it 'dont exists', ->
    # Check if channel exists
    channels.exists('invalid')
    .should.resolvedWith false
  
  it 'list', ->
    # Create our users
    user_1 = await users.create
      username: 'user_1'
    user_2 = await users.create
      username: 'user_2'
    # Create our channels
    channel_1 = await channels.create
      name: 'channel_1'
      users: [
        user_1
        user_2
      ]
    channel_2 = await channels.create
      name: 'channel_2'
      users: [
        user_1
      ]
    # List the channels
    records = await channels.list()
    records.length.should.equals 2
