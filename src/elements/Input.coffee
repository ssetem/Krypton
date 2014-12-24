module.exports = (Element, HasText, CanType) ->

  class Input extends Element

    @include HasText
    @include CanType