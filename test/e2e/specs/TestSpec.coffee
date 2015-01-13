describe 'angularjs homepage', ->

  beforeEach ->
    injector().inject (@Experiments) =>
      k = @Experiments
      @k = k
      class k.ChatForm extends k.Component
        constructor:()->
          super
          @qa "chat-form"
          @addComponent "message", k.Input.create().qa("message")

      class k.UserForm extends k.Component
        selector:new k.qa("user-form")

        constructor:()->
          super
          @addComponent "username", k.Input.create().qa("username")
          @addComponent "sendAction", k.Input.create().qa("send-action")

      class k.ChatPage extends k.Component
        name:"ChatPage"
        selector:new k.qa("chat-page")
        constructor:()->
          super
          @addComponent "title", k.Component.create().css("h4")
          @addComponent "chatForm", k.ChatForm.create()
          @addComponent "userForm", k.UserForm.create()


      @chatPage = k.ChatPage.create()

  it "should assert name", ->
    browser.get 'http://localhost:3001/index.html'
    expect(@chatPage.title.getText())
      .toEqual("A simple chat system")
    @chatPage.userForm.username.type("Harrow")

