module.exports = (Element, Input) ->

  class ChatFormComponent extends Element

    selector: QAS "chat-form"

    constructor: ->
      @component "message", Input, selector: QAS "message"
      @component "submit", Button, selector: QAS "send-action"
      @component "clear", Button, selector: QAS "clear-action"
      super