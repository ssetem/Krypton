module.exports = (Operation, _, expect)->

  ops = {}

  class ops.isPresent extends Operation
    method:"isPresent"
    expectMethod:"expectPresent"

  class ops.isDisplayed extends Operation
    method:"isDisplayed"
    expectMethod:"expectDisplayed"

  class ops.isEnabled extends Operation
    method:"isEnabled"
    expectMethod:"expectEnabled"

  class ops.click extends Operation
    method:"click"

  class ops.getText extends Operation
    method:"getText"
    expectMethod:"expectText"

  class ops.waitUntilPresent extends Operation
    method:"waitUntilPresent"

    run:(timeout = 5000)->
      (browser.driver.wait =>
        @component.getElement().isPresent()
      ,timeout)


  class ops.get extends Operation
    method:"get"

    run:()->
      @component.getElement()

  class ops.type extends Operation
    method:"type"

    run:(value)->
      @component.getElement()
        .clear().sendKeys(value)

  class ops.is extends Operation
    method:"is"
    expectMethod:"expectIs"
    onComponentRegistered:()->
      @component.states = (states)=>
        @_states ?= {}
        _.extend(@_states, states)

    expectRun:(state, val=true)=>
      expect(@run(state)).to.eventually.equal(val)

    run:(expectedState)->
      stateClass = @_states[expectedState]
      unless stateClass
        throw new Error("#{@getApiPath()}: Could not find state for: #{expectedState}")

      @component.getElement().getAttribute("class").then (classNames)->
        !!(classNames.split(" ").indexOf(stateClass))

  return ops