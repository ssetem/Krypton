module.exports = (CreditCardForm, QAS, Dialog, Button) ->

  class AddCreditCardDialog extends Dialog

    name: "Add credit card dialog"
    selector: QAS "add-credit-card-dialog"

    constructor: ->
      @component "save action", Button, selector:QAS("save-action") 
      @component "form", CreditCardForm
      @component "list", ItemList, selector: QAS("credit-cards"), itemSelector: QAS("credit-card--item")


module.exports = (QAS, Input) ->

  class CreditCardForm extends Element

    selector: QAS "credit-card-form"

    constructor: ->
      @component "number" , Input, selector: QAS("number")
      @component "expiry" , Input, selector: QAS("expiry")
      @component "cvc"    , Input, selector: QAS("cvc")



module.exports = (ElementStates) ->

  class Element

    states: ElementStates

    constructor: (overrides) ->
      @states = overrides.states or @states
      @selector = overrides.selector or @selector

module.exports = (Element, InputStates) ->

  class Input extends Element
    @include InputStates
    @include GenericStates
    


module.exports = () ->

  class ElementStates

    states: -> {
      "invalid": @hasClass("invalid")
      "hidden": @isVisible(false)
    }

    getStates: ->
      _.extend(super,@states())


module.exports = (ElementStates) ->

  class InputStates extends ElementStates

    states: -> {
      "disabled": @isDisabled()
    }  