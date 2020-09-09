
require './test'
users = require '../lib/users'

describe 'users', ->
  
  it 'create user', ->
    user = await users.create
      username: 'david'
      email: 'david@adaltas.com'
    users.exists(user)
    .should.resolvedWith true
      
  it 'dont exists', ->
    # Check if channel exists
    users.exists('invalid')
    .should.resolvedWith false
      
  it 'list users', ->
    user_1 = await users.create
      username: 'user_1'
      email: 'david@adaltas.com'
    user_2 = await users.create
      username: 'user_2'
      email: 'david@adaltas.com'
    records = await users.list()
    records.length.should.eql 2
    
