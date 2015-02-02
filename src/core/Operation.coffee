module.exports = (Module)->

  class Operation extends Module

    constructor:()->
      super
      @component

    setComponent:(@component)-> @

    run:()->
      @component.getElement()["#{@method}"]()

    getObjectPath:()->{
      selector:@getSelector().join(" ")
      api:@getPath().join(".")
    }

    getPath:()->
      @component.getPath().concat [@method]

    getSelector:()->
      @component.selector?.toLocators() or
      ["Undefined locator"]