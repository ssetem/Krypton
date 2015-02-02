module.exports = (Component, DefaultOperations)->

  class Input extends Component
    name:"Input"

    constructor:()->
      super
      @registerOperationMethods "type"
      @addOperations DefaultOperations.isEnabled

    type:(value)->
      @getElement()
        .clear().sendKeys(value)