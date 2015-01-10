'use strict';

var gulp = require('gulp')
  , format = require('util').format
  , fs = require('fs')


gulp.task('move', function() {
  return gulp.src('./sources/**/*')
    .pipe(gulp.dest('./build'))
})

gulp.task('watch', function () {
  gulp.watch('./sources/**/*', ['move'])
})

gulp.task('build', ['move']);

gulp.task('default', ['build']);