module.exports = ->

  new class FinderUtils

    getElement: (css) ->
      protractor.By.css(css)

    isElementVisible: (element) ->
      ptor.isElementPresent(element).then (isPresent) =>
        if isPresent
          @_elementScrollToView(ptor.element(element)).then ->
            ptor.element(element).isDisplayed()
        else
          false

    fillText: (element) ->
      element.clear()
      element.sendKeys(text)