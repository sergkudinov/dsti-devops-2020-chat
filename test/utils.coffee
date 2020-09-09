
utils = require '../lib/utils'

describe 'utils', ->
  
  describe 'username_validate', ->
  
    it 'validates a regular string', ->
      utils.username_validate('david').should.be.true()
      
    it 'validates a string with numbers', ->
      utils.username_validate('david03').should.be.true()
    
