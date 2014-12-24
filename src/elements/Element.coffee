module.exports = () ->

  class Element

    constructor: (@parentComponent, @options) ->

    component: (name, component, options) ->
      (@_components ?= []).push(name)
      @[name] = component.create(@, options)

    @create:(parentComponent, options)->
      new @(parentComponent, options)

    @apiMethod:(methodName, method)->
      (@::_apiMethods ?= []).push(methodName)
      @::[methodName] = method

    @traits:(traits...)->
      for t in traits
        for methodName, method of t
          @apiMethod methodName, method