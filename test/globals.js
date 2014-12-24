var path              = require("path");
global.sinon          = require('sinon');
global.chai           = require('chai');
global.expect         = chai.expect
global.srcDir         = path.resolve(__dirname, "../src");
global.testDir        = path.resolve(__dirname);

process.env.NODE_ENV = "test";
global.kryptonInjector = require(path.join(srcDir, "injector"));
global.fixtureInjector = require(path.join(testDir, "fixtures","injector"));

process.setMaxListeners(1000);