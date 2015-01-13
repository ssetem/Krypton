describe.only "Experiment", ->

  beforeEach ->
    kryptonInjector().inject (@Experiments)=>
      @k = @Experiments

  it "should exist", ->
    expect(@k).to.exist

  it "login form", ->

    loginForm = @k.LoginForm.create()

    # loginForm.username.click()
    # loginForm.username.type()
    console.log loginForm.username.getElement()
    # # loginForm.password.click()
    # # loginForm.username.isDisplayed()
    # apis = []
    # walk = (C)->
    #   for k, v of C._components
    #     walk(v)

    #   for k, v of C._operations
    #     apis.push v.getObjectPath()

    # walk loginForm

    # console.log JSON.stringify apis, null, 2




