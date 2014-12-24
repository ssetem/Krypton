describe.only "GeneralTests", ->

  beforeEach ->
    fixtureInjector().inject ($injector, @ChatFormComponent, @ElementPrinter)=>
      # console.log $injector.getRegex /.+/


  it "should exist", ->
    # console.log new @ChatFormComponent().message.type("foo")

  it "ElementPrinter", ->
    printer = new @ElementPrinter(new @ChatFormComponent)
    printer.print()
