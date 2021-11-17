require 'sinatra/base'
require 'sinatra/reloader'
require  './lib/space'
require  './lib/booking'

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

  get '/book_space' do
    erb :book_space
  end

  post '/book_space' do
    session[:booking] = Booking.create(params[:space_name], params[:date])
    redirect '/booking_confirmation'
  end

  get '/booking_confirmation' do
    erb session[:booking]
  end

  run! if app_file == $0
end