#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
require 'shelljs/make'

target.all = ->
  echo 'Hello World!'
