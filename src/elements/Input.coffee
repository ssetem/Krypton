module.exports = (Element, CanType, HasText) ->

  class Input extends Element

    @traits CanType, HasText
