describe 'angularjs homepage', ->

  beforeEach ->
    injector.inject (ChatPage) =>
      @chatPage = new ChatPage()
      @chatPage.visit()

  it "should assert name", ->

    # @chatPage.userForm.username.type("joe")
    browser.get 'http://localhost:3001/index.html'
    title = element(protractor.By.css("h4"))
    expect(title.getText()).toEqual("A simple chat system")