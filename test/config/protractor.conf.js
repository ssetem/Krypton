require('coffee-script');
injector = require("../e2e/injector")

exports.config = {

  seleniumAddress: 'http://localhost:4444/wd/hub',
  chromeDriver: '../../../selenium/chromedriver',
  baseUrl: "http://localhost:3000/",

  specs: [
    '../e2e/**/*.coffee'
  ],

  jasmineNodeOpts: {
    defaultTimeoutInterval: 30000,
    isVerbose: false,
    showColors: true,
    includeStackTrace: true
  },

  onPrepare: function() {
     injector().inject(function(Server) {
        Server.start()
     })
  }

};