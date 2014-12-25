module.exports = (Utils, FinderUtils) ->

  class Element

    states: {}

    @create:(parentComponent, options)->
      new @(parentComponent, options)

    @apiMethod:(methodName, method)->
      (@::_apiMethods ?= []).push(methodName)
      @::[methodName] = method

    @traits:(traits...)->
      for t in traits
        for methodName, method of t
          @apiMethod methodName, method

    constructor: (@parentComponent, options) ->
      Utils.extends(@, options)

    component: (name, component, options) ->
      (@_components ?= []).push(name)
      @[name] = component.create(@, options)

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
      