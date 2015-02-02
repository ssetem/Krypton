module.exports = (Component, DefaultOperations)->

  class Input extends Component
    name:"Input"

    constructor:()->
      super
      @addOperations DefaultOperations.isEnabled, DefaultOperations.type
