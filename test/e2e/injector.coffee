spur = require "spur-ioc"

module.exports = ()->

  ioc = spur.create("kryptonE2E")
  ioc.use("krypton")

  ioc.registerDependencies {
    "Server": require("./app/Server")
  }

  ioc.registerFolders __dirname, [
    "fixtures"
  ]

  ioc


