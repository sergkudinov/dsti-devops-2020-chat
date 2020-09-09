
users = require '../lib/users'

describe 'users', ->
  
  it 'create user', ->
    user = await users.create
      username: 'david'
      email: 'david@adaltas.com'
    users.exists(user)
    .should.resolvedWith true
    
