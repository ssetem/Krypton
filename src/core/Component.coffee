module.exports = (Module, Operation, DefaultOperations, Selector, _)->

  ops = DefaultOperations


  class Component extends Module

    constructor:()->
      super
      @parent
      @name
      @_states = {}
      @addOperations ops.isDisplayed, ops.click, ops.getText, ops.get


    states:(states)->
      _.extend(@_states, states)
      @

    is:(expectedState)->
      stateClass = @_states[expectedState]
      unless stateClass
        throw new Error("Could not find state for: #{expectedState}")

      @getElement().getAttribute("class").then (classNames)->
        !!(classNames.split(" ").indexOf(stateClass))


    qa:(value)->
      @selector = new Selector.qa(value)
      @

    css:(value)->
      @selector = new Selector.css(value)
      @

    getElement:()->
      reducer = (currentElement, locator)->
        currentElement.element(locator)
      nullElement = {element:element}
      _.reduce(@selector.toLocators(), reducer, nullElement)


    component:(name, componentConstructor, options)->
      component = componentConstructor.create(options)
      component.parent = @
      component.name = name
      component.selector?.setParent(@selector)
      @_components ?= {}
      @[name] = @_components[name] = component

    addOperations:(operations...)->
      for op in operations
        @addOperation new op().setComponent(@)

    addOperation:(operation)->
      @_operations ?= {}
      @_operations[operation.method] = operation
      method = @[operation.method] = ()->
        operation.run.apply(operation, arguments)
      method.operation = operation

    registerOperationMethods:(methods...)->
      for method in methods
        methodInstance = @[method]
        if methodInstance
          operation = new Operation()
          operation.method = method
          operation.component = @
          operation.run = methodInstance.bind(@)
          @addOperation(operation)

    getPath:()->
      (@parent?.getPath() or []).concat [@name]

    @create:(builder)->
      comp = new @()
      for own k,v of builder
        prop = comp[k]
        if _.isFunction(prop)
          comp[k](v)
        else
          comp[k] = v
      comp

