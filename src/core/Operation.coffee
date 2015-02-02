module.exports = (Module, expect)->

  class Operation extends Module

    constructor:()->
      super
      @component

    setComponent:(@component)->
      @onComponentRegistered()
      @

    onComponentRegistered:()->

    run:()->
      @component.getElement()["#{@method}"]()

    expectRun:(val=true)=>
      expect(@run()).to.eventually.equal(val)

    getObjectPath:()->{
      selector:@getSelector().join(" ")
      api:@getApiPath()
    }

    getApiPath:()->
      @getPath().join(".")

    getPath:()->
      @component.getPath().concat [@method]

    getSelector:()->
      @component.selector?.toLocators() or
      ["Undefined locator"]