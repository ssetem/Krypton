module.exports = (Module, Utils, FinderUtils) ->

  class Element extends Module

    states: {}

    constructor: (@parentComponent, options) ->
      Utils.extends(@, options)

    component: (name, component, options) ->
      @[name] = new Component(@, options)

    getParents: ->
      hasParent = true
      context = @
      parents = []

      while hasParent
        hasParent = context.parentComponent?
        parents.push context.parentComponent if context.parentComponent
        context = context.parentComponent

      parents.reverse()

    getElementSelector: ->
      elements = @getParents()
      elements.push(@)
      css = ""

      css += element.selector.toCSS() for element in elements
      css

    getElement: ->
      FinderUtils.getElement @getElementSelector()

    isElementVisible: ->
      FinderUtils.isElementVisible @getElement()

    inState:(state) ->
      @states[state]?()
      
