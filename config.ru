require './app.rb'

run Sinatra::Application

configure :production do
  require 'newrelic_rpm'
end