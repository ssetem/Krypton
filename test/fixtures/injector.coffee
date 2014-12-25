spur = require "spur-ioc"
krypton = require "../../src/Injector"
module.exports = ()->

  ioc = spur.create("kryptonE2E")
  ioc.use(krypton())

  ioc.registerDependencies {
    # "Server": require("./app/Server")
  }

  ioc.registerFolders __dirname, [
    "page-objects"
  ]

  ioc


