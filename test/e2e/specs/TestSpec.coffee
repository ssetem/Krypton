describe 'angularjs homepage', ->

  it "should assert name", ->
    browser.get 'http://localhost:3001/index.html'
    title = element(protractor.By.css("h4"))
    expect(title.getText()).toEqual("A simple chat system")