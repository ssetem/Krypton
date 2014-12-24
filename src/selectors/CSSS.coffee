module.exports = ->

  class CSSS

    @create: (css)->
      new CSSS(css)

    constructor: (css) ->
      @cssSelector = "#{css} "

    toCSS: ->
      @cssSelector

  CSSS.create