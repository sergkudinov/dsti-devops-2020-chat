
{exec} = require 'child_process'

beforeEach ->
  new Promise (resolve, reject) ->
    exec "rm -rf #{__dirname+'/../db'}", (err) ->
      if err then reject(err) else resolve()
