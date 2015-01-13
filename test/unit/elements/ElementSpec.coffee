describe "Element", ->

  beforeEach ->
    kryptonInjector().inject (@Element, @CSSS, @QAS) =>
      @elementA = new @Element(null, {selector: @CSSS(".elementA")})
      @elementB = new @Element(@elementA, {selector: @CSSS(".elementB")})
      @elementC = new @Element(@elementB, {selector: @QAS("elementC") })
      
  it "getParents()", ->
    expect(@elementC.getParents()).to.deep.equal([@elementA, @elementB])

  it "getElementSelector()", ->
    expect(@elementC.getElementSelector()).to.equal(".elementA .elementB [data-qa='elementC']")

