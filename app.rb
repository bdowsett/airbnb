require 'sinatra/base'
require 'sinatra/reloader'
require  './lib/space'

class Airbnb < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @listing = Space.all



    erb :index
  end

  get '/add_space' do
   erb :add_space
  end
  
  post '/add_space' do
    Space.create(params[:space_name], params[:description], params[:location], params[:price])
    redirect '/'
  end

  run! if app_file == $0
end