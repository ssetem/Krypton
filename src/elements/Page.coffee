module.exports = (Element) ->

  class Page extends Element

    visit: ->
      ptor.get("/#{@url}")