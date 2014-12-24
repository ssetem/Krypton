describe "Element", ->

  beforeEach ->
    injector().inject (@Element, @CSSS, @QAS) =>
      @elementA = new @Element()
      @elementB = new @Element(@elementA)
      @elementC = new @Element(@elementB)
      
      @elementA.selector = @CSSS(".elementA")
      @elementB.selector = @CSSS(".elementB")
      @elementC.selector = @QAS("elementC")

  it "getParents()", ->
    expect(@elementC.getParents()).to.deep.equal([@elementA, @elementB])

  it "getElementSelector()", ->
    expect(@elementC.getElementSelector()).to.equal(".elementA .elementB [data-qa='elementC'] ")

