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
    
  bikes = Bike.all

  erb :bikes, locals: { foundbikes: bikes }
end

get '/bikes/new' do
  @bike = Bike.new
  erb :new_bike
end

post '/bikes' do
  # {:id => 1, :broken => true}
  bike = Bike.create(params[:bike])
  redirect to("/bikes/#{bike.id}")
end

get '/bikes/:id' do
  @bike = Bike.get(params[:id])
  erb :show_bike
end

get '/bikes/:id/update' do
  @bike = Bike.get(params[:id])

  erb :edit_bike
end

put '/bikes/:id/update' do
  bike = Bike.get(params[:id])
  bike.update(params[:bike])
  redirect to("/bikes/#{bike.id}")
end 


# Test at <appname>.heroku.com (you'll need to create your app first!)

helpers do
  def escape_html(text)
    Rack::Utils.escape_html(text)
  end
end

# bikes = Array.new(10) { Bike.new }
# bikes.each{|bike| bike.save }