module.exports = ->

  class QAS

    @create: (name)->
      new QAS(name)

    constructor: (name) ->
      @cssSelector = "[data-qa='#{name}'] "

    toCSS: ->
      @cssSelector

  QAS.create