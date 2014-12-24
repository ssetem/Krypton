module.exports = ()->

  class ElementPrinter

    constructor:(@rootElement)->

      @rootName = @rootElement.constructor.name


    print:()->
      @apis = []

      for c in @rootElement._components
        console.log @rootName + "." + c