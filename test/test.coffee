
db = require '../lib/db'

beforeEach ->
  await db.clear()
