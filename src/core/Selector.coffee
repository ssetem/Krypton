module.exports = ()->
  class Selector

    constructor:(@value)->

    setParent:(@parent)-> @

    toLocators:()->
      (@parent?.toLocators() or [])
        .concat(@toLocator())


  Selector.qa =
    class qa extends Selector
      toLocator:()->
        By.css("[data-qa='#{@value}']")

  Selector.css =
    class css extends Selector
      toLocator:()->
        By.css("#{@value}")

  return Selector
