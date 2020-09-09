
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
        list:
          description: 'List created users.'
          route:
            routes.users.list
    channels:
      commands:
        create:
          description: 'Create a new channel.'
          options:
            name:
              description: "Name of the channel."
              required: true
              shortcut: 'n'
            users:
              description: "Users with channel access."
              required: true
              shortcut: 'u'
              type: 'array'
          route:
            routes.channels.create
        exists:
          description: 'Check if a channel exists.'
          options:
            id:
              description: 'Channel identifier.'
              required: true
              shortcut: 'i'
          route:
            routes.channels.exists
        list:
          description: 'List created channels.'
          route:
            routes.channels.list
    server:
      commands:
        start:
          description: 'Start the web server.'
          options:
            port:
              description: "Web server port to listent to."
              type: 'integer'
              shortcut: 'p'
          route:
            routes.server.start
              
