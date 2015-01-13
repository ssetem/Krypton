spur = require "spur-ioc"

module.exports = ()->

  ioc = spur.create("krypton")

  ioc.registerLibraries {
    "_":"lodash"
  }

  ioc.registerDependencies {

  }

  ioc.registerFolders __dirname, [
    "elements"
    "selectors"
    "core"
    "experiments"
  ]

  ioc