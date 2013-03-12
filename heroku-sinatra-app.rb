# Remember to run the server when testing locally
# by going ruby heroku-sinatra-app.rb
# then go to localhost:4567 in your browser
#
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?


# Using datamapper for the ORM, with Postgres
# see http://datamapper.org/getting-started.html
require 'data_mapper'
DataMapper.setup(:default, ENV['DATABASE_URL'] || postgres://localhost/boris_bikes.db')

# set :database, ENV['DATABASE_URL'] || 'postgres://localhost/[YOUR_DATABASE_NAME]'

# Our Application Files
require './lib/bike'


# for templates uncomment the line below
# require 'erb'

get '/' do
  # This will be your default route
  erb :home
end

get '/bikes' do
  # bikes = Array.new(10) { Bike.new }
  bikes = []
  10.times{ bikes << Bike.new }
  puts bikes.inspect

  erb :bikes, locals: { bikes: bikes }
end

# Test at <appname>.heroku.com (you'll need to create your app first!)

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end