require "rubygems"
require "bundler/setup"
require "sinatra"

ROOT = File.dirname(__FILE__)

require "#{File.dirname(__FILE__)}/lib/app"



set :environemt, :production
use Rack::ShowExceptions

run GodSaveThePrint::App