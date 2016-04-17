require 'sinatra'
require 'json'

require './config/routes'
require './dependencies'
require './application'

run Calc::Application