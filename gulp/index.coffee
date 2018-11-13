# import dd from 'ddeyes'
import del from 'del'

import fs from 'fs'

import gulp from 'gulp'
import gulpSequence from 'gulp-sequence'
import rename from 'gulp-rename'

import rollup from 'gulp-better-rollup'
import {
  coffee2
  babel
} from 'cfx.rollup-plugin-coffee2'

import cleanup from 'rollup-plugin-cleanup'

gulp.task 'clean', (cb) =>
  del [ './dist' ]
  , cb

gulp.task 'buildEs', =>

  gulp.src './src/index.coffee'
  .pipe rollup
    plugins: [
      coffee2
        bare: true
        sourceMap: true
      cleanup()
    ]
  , 'es'
  .pipe rename 'index.js'
  .pipe gulp.dest './dist/es'

gulp.task 'buildCjs', =>

  gulp.src './dist/es/index.js'
  .pipe rollup
    plugins: [
      babel()
      cleanup()
    ]
  , 'cjs'
  .pipe rename 'index.js'
  .pipe gulp.dest './dist'

gulp.task 'bundlejs', (cb) =>

  fs.writeFile './dist/bundle.js'
  , """
  module.exports = require('./index');
  """
  , 'utf-8'
  , cb

gulp.task 'build'
,
  gulpSequence(
    'buildEs'
    'buildCjs'
    'bundlejs'
  )

gulp.task 'rebuild'
,
  gulpSequence(
    'clean'
    'build'
  )
