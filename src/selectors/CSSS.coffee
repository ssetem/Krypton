module.exports = ->

  class CSSS

    constructor: (@selector) ->
    
    toCSS: ->
      "#{@selector} "