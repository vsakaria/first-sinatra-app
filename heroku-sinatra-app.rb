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
require 'dm-migrations'

# Our Application Files
require './lib/bike'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||= 'postgres://localhost/borisbikes')
#How do we run this only once?
DataMapper.finalize.auto_upgrade!


# for templates uncomment the line below
# require 'erb'

get '/' do
  # This will be your default route
  erb :home
end

get '/bikes' do
  #   foundbikes = [] 

  
  #   bike = Bike.new
  #   bike.save
  #   foundbikes = Bike.get(1)
  

  # erb :bikes, locals: { foundbikes: foundbikes }
end

# Test at <appname>.heroku.com (you'll need to create your app first!)

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end