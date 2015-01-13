module.exports = ->

  new class CanType

    type:(val)->
      console.log "type", @, val

