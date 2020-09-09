
routes = require './routes'

module.exports =
  name: 'Chat'
  description: 'DSTI chat application'
  commands:
    users:
      commands:
        create:
          description: 'Create a new user.'
          options:
            username:
              description: 'Username of the user'
              required: true
              shortcut: 'u'
            password:
              description: 'password of the user'
              required: true
              shortcut: 'p'
            email:
              description: 'Email of the user'
              required: true
              shortcut: 'e'
          route:
            routes.users.create
        exists:
          description: 'Check if a user exists.'
          options:
            username:
              description: 'Username of the user.'
              required: true
              shortcut: 'u'
          route:
            routes.users.exists
              
