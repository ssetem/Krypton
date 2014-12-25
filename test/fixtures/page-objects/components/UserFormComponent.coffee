module.exports = (Element, Input, Button, QAS) ->

  class UserFormComponent extends Element

    selector: QAS "user-form"

    constructor: ->
      @component "username", Input, selector: QAS "username"
      @component "submit", Button, selector: QAS "send-action"
      super
