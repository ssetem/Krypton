module.exports = (DefaultOperations, Component)->

  class Button extends Component
    name:"Button"
    constructor:()->
      super
      @addOperations DefaultOperations.isEnabled