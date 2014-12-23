module.exports = (Page, UserFormComponent, ChatBoxComponent, ChatFormComponent) ->

  class ChatPage extends Page

    selector: QAS "chat-page"

    constructor: ->
      @component "userForm", UserFormComponent
      @component "chatBox", ChatBoxComponent
      @component "chatForm", ChatFormComponent