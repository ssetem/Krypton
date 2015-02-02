describe 'angularjs homepage', ->

  beforeEach ->
    injector().inject (Component, Selector, Input, Button) =>


      class ChatForm extends Component
        constructor:()->
          super
          @qa "chat-form"
          @addComponent "message", Input.create().qa("message")
          @addComponent "sendAction", Button.create().css("#sendMessage")

      class UserForm extends Component
        selector:new Selector.qa("user-form")

        constructor:()->
          super
          @addComponent "username", Input.create().qa("username").states({valid:"ng-valid"})
          @addComponent "sendAction", Button.create().qa("send-action")

      class TitleMixin
        constructor:()->
          @addComponent "title", Component.create().css("h4")

      class ChatPage extends Component
        @include TitleMixin
        name:"ChatPage"
        selector:new Selector.qa("chat-page")
        constructor:()->
          super
          @addComponent "chatForm", ChatForm.create()
          @addComponent "userForm", UserForm.create()
          @addComponent "messageList", Component.create().qa("messages")


      @chatPage = ChatPage.create()

  it "should assert name", ->

    apis = []
    walk = (C)->
      for k, v of C._components
        walk(v)

      for k, v of C._operations
        apis.push v.getObjectPath().api

    walk @chatPage

    console.log JSON.stringify apis, null, 2



    # @chatPage.userForm.username.type("joe")
    browser.get 'http://localhost:3002/index.html'
    # browser.pause()
    expect(@chatPage.title.getText())
      .toEqual("A simple chat system")
    expect(@chatPage.userForm.sendAction.isEnabled())
      .toBe(false)
    @chatPage.userForm.username.type("Bob")
    expect(@chatPage.userForm.username.is("valid"))
      .toBe(true)
    @chatPage.userForm.sendAction.click()
    expect(@chatPage.chatForm.sendAction.isEnabled())
      .toBe(false)
    @chatPage.chatForm.message.type("Hi everyone")
    @chatPage.chatForm.sendAction.click()
    @chatPage.chatForm.message.type("Hi again")
    @chatPage.chatForm.sendAction.click()


