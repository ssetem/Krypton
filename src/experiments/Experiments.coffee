module.exports = (_)->
  k = {}

  By = protractor.By

  # element = mockElement = {
  #   locators:[]
  #   element:(locator)->
  #     @locators.push(locator)
  #     @
  # }

  class k.Operation

    constructor:()->
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

  class k.isDisplayed extends k.Operation
    method:"isDisplayed"

  class k.click extends k.Operation
    method:"click"

  class k.getText extends k.Operation
    method:"getText"


  class k.Selector

    constructor:(@value)->

    setParent:(@parent)-> @

    toLocators:()->
      (@parent?.toLocators() or [])
        .concat(@toLocator())

  class k.qa extends k.Selector
    toLocator:()->
      By.css("[data-qa='#{@value}']")

  class k.css extends k.Selector
    toLocator:()->
      By.css("#{@value}")

  class k.Component

    constructor:(options)->
      @parent
      @name
      @selector = options.selector or @selector
      @addOperations k.isDisplayed, k.click, k.getText

    qa:(value)->
      @selector = new k.qa(value)
      @

    css:(value)->
      @selector = new k.css(value)
      @

    getElement:()->
      reducer = (currentElement, locator)->
        currentElement.element(locator)
      nullElement = {element:element}
      _.reduce(@selector.toLocators(), reducer, nullElement)


    addComponent:(name, component)->
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
        operation.run()
      method.operation = operation

    registerOperationMethods:(methods...)->
      for method in methods
        methodInstance = @[method]
        if methodInstance
          operation = new k.Operation()
          operation.method = method
          operation.component = @
          operation.run = methodInstance.bind(@)
          console.log operation.run.toString()
          @addOperation(operation)

    getPath:()->
      (@parent?.getPath() or []).concat [@name]

    @create:(selector)->
      comp = new @({selector})





  class k.Input extends k.Component
    name:"Input"

    constructor:()->
      super
      @registerOperationMethods "type"

    type:(value)->
      @getElement()
        .clear().sendKeys(value)


  class k.Button extends k.Component
    name:"Button"

  #Example Login form

  class k.LoginForm extends k.Component
    selector:new k.qa("login--form")
    name:"LoginForm"
    constructor:()->
      super
      @addComponent "username", k.Input.create().qa("username")
      @addComponent "password", k.Input.create().qa("password")
      @addComponent "submit", k.Input.create().qa("submit")


  return k