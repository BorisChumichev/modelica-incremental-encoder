'use strict';

var gulp = require('gulp')
  , shell = require('gulp-shell')
  , runSequence = require('run-sequence')


gulp.task('move', function() {
  return gulp.src('./sources/**/*')
    .pipe(gulp.dest('./build'))
})

gulp.task('compile', shell.task([
  'omc main.mos > ../print.txt',
], {cwd: process.cwd() + '/build'}))

gulp.task('watch', function () {
  gulp.watch('./sources/**/*', ['move'])
})

gulp.task('build', function (cb) {
  runSequence('move', 'compile', cb)
});

gulp.task('default', ['build']);