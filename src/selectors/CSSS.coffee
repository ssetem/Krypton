module.exports = ->

  class CSSS

    constructor: (@selector) ->

    toCSS: ->
      "#{@selector} "


  return (selector)-> new CSSS(selector)
