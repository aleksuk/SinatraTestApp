require 'sinatra'
require 'sinatra-initializers'
require 'dotenv'

Dotenv.load

require 'mongoid'
require 'mini_magick'
require 'carrierwave/mongoid'
require 'tilt/jbuilder'
require './dependencies'
require './application'

run Calc::Application