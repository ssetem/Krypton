module.exports = (Element, CanClick, HasText) ->

  class Button extends Element

    @include HasText
    @include CanClick