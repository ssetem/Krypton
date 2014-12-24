describe "Utils", ->

  beforeEach ->
    injector().inject (@Utils) =>
      

  it "extends()", ->
    objA = {a:12}
    objB = {b:24, a:13}
    
    @Utils.extends(objA,objB)

    expect(objA).to.deep.equal({a:13,b:24})