spur           = require "spur-ioc"
spurCommon     = require "spur-common"

module.exports = ()->

  ioc = spur.create("krypton")

  ioc.merge(spurCommon())

  ioc.registerFolders __dirname, [
    "core", "elements", "assertions"
  ]

  ioc