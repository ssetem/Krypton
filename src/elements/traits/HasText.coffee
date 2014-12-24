module.exports = ->

  new class HasText

    getText:()->
      console.log "getText", @
