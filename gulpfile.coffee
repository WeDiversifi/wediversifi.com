gulp = require 'gulp'
gutil = require 'gulp-util'
notify = require 'gulp-notify'
less = require 'gulp-less'
coffee = require 'gulp-coffee'
rename = require 'gulp-rename'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
minify = require 'gulp-minify-css'

lessDir = 'app/assets/less'
cssTarget = 'public/css'

gulp.task 'less', ->
  gulp.src lessDir + '/application.less'
    .pipe less()
    .on 'error', gutil.log
    .on 'error', notify.onError()
    .pipe rename 'style.css'
    # .pipe minify()
    .pipe gulp.dest cssTarget
    .pipe notify 'LESS compiled'

gulp.task 'watch', ->
    gulp.watch lessDir + '/**/*.less', ['less']

gulp.task 'default', ['less', 'watch']
