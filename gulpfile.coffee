coffee = require "gulp-coffee"
concat = require 'gulp-concat'
gulp = require 'gulp'
protractor = require("gulp-protractor").protractor

paths = {
  e2e: "./test/e2e/specs/*Spec.coffee"
  framework: "./src/**/*"
}

gulp.task 'e2e', ()->
  gulp.src([paths.e2e])
    .pipe(protractor({
      configFile: "test/config/protractor.conf.js"
    })) 
    .on('error', (e) -> throw e )

gulp.task 'watch', ->
  gulp.watch(paths.e2e, ['e2e'])
  gulp.watch(paths.framework, ['e2e'])


gulp.task 'default', ['watch']
