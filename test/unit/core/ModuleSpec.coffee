describe "Module", ->

  beforeEach ->
    injector().inject (@Module) =>

      trait1 = class Trait1 extends Module
        addMethod: -> "addMethod"

      @example = class Example extends Module
        @include trait1

        constructor: ->

        secondMethod: -> "untouched"

  it "works", ->
    example = new @example()
    expect(example.addMethod()).to.equal("addMethod")
    expect(example.secondMethod()).to.equal("untouched")
