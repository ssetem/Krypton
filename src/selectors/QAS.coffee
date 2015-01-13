module.exports = ->

  class QAS

    constructor: (@selector) ->

    toCSS: ->
      "[data-qa='#{@selector}']"


  return (selector)-> new QAS(selector)

