module.exports = (Element, QAS, ItemList) ->

  class ChatBoxComponent extends Element

    selector: QAS "chat-box"

    constructor: ->
      @component "messages", ItemList, selector: QAS("messages"), itemSelector: QAS("message")
      super