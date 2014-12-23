coffee = require "gulp-coffee"
concat = require 'gulp-concat'
gulp = require 'gulp'
protractor = require("gulp-protractor").protractor


gulp.task 'coffee', ->
  gulp.src("./src/*.coffee")
    .pipe(coffee(bare:true).on('error', gutil.log))
    .pipe(gulp.dest("./lib"))

gulp.task 'e2e', ()->
  gulp.src(["./test/e2e/specs/*Spec.coffee"])
    .pipe(protractor({
      configFile: "test/config/protractor.conf.js"
    })) 
    .on('error', (e) -> throw e )


gulp.task 'default', ['coffee']
