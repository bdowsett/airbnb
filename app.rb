require 'sinatra/base'
require 'sinatra/reloader'

class Airbnb < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @listing = [session[:space_name], session[:description], session[:location], session[:price]]
    erb :index
  end

  get '/add_space' do
   erb :add_space
  end
  
  post '/add_space' do
    session[:space_name] = params[:space_name]
    session[:description] = params[:description]
    session[:location] = params[:location]
    session[:price] = params[:price]
    redirect '/'
  end

  run! if app_file == $0
end