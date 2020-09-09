
module.exports =
  username_validate: (username) ->
    /^\w+$/.test username
