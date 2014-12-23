spur = require "spur-ioc"

module.exports = ()->

  ioc = spur.create("krypton")

  ioc.registerLibraries {

  }

  ioc.registerDependencies {

  }

  ioc.registerFolders __dirname, [
    "elements"
    "selectors"
    "states"
    "core"
  ]

  ioc