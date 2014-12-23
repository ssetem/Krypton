var path              = require("path");
global.sinon          = require('sinon');
global.chai           = require('chai');
global.expect         = chai.expect
global.srcDir         = path.resolve(__dirname, "../src");

process.env.NODE_ENV = "test";
global.injector = require(path.join(srcDir, "injector"));

global.injector().registerFolders(__dirname, [
  "fixtures"
])

process.setMaxListeners(1000);