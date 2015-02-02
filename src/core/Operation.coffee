module.exports = (Module, expect)->

  class Operation extends Module

    constructor:()->
      super
      @component


    setComponent:(@component)->
      @onComponentRegistered()
      @

    onComponentRegistered:()->

    executeRun:()->
      @run.apply(@, arguments)
        .then null, (e)=>
          e.message = @getApiPath() + ": " + e.message
          throw e

    run:()->
      @component.getElement()["#{@method}"]()


    expectRun:(val=true)=>
      expect(@executeRun(), @getApiPath()).to.eventually.equal(val)

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