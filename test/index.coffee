#!/usr/bin/env coffee
{
  log
  error
} = console
echo = log
require 'shelljs/make'
dd = require 'ddeyes'

target.all = ->

  echo 'Hello World!'
