describe 'angularjs homepage', ->

  beforeEach ->
    injector().inject (Component, Selector, Input, Button) =>


      class ChatForm extends Component
        constructor:()->
          super
          @qa "chat-form"
          @component "message", Input, qa:"message"
          @component "sendAction", Button, css:"#sendMessage"

      class UserForm extends Component
        selector:new Selector.qa("user-form")

        constructor:()->
          super
          @component "username", Input, qa:"username", states:{valid:"ng-valid"}
          @component "sendAction", Button, qa:"send-action"

      class TitleMixin
        constructor:()->
          @component "title", Component, css:"h4"

      class ChatPage extends Component
        @include TitleMixin
        name:"ChatPage"
        selector:new Selector.qa("chat-page")
        constructor:()->
          super
          @component "chatForm", ChatForm
          @component "userForm", UserForm
          @component "messageList", Component, qa:"messages"


      @chatPage = ChatPage.create()

  it "should assert name", ->

    apis = []
    walk = (C)->
      for k, v of C._components
        walk(v)

      for k, v of C._operations
        apis.push v.getObjectPath().api

    walk @chatPage

    # console.log JSON.stringify apis, null, 2


    browser.get 'http://localhost:3002/index.html'
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


