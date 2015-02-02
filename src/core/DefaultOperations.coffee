module.exports = (Operation)->

  ops = {}

  class ops.isDisplayed extends Operation
    method:"isDisplayed"

  class ops.isEnabled extends Operation
    method:"isEnabled"

  class ops.click extends Operation
    method:"click"

  class ops.getText extends Operation
    method:"getText"

  class ops.get extends Operation
    method:"get"

    run:()->
      @component.getElement()

  return ops