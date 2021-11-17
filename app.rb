require 'sinatra/base'
require 'sinatra/reloader'
require  './lib/space'
require  './lib/booking'
require  './lib/account'

class Airbnb < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @listing = Space.all
    @username = session[:current_username]
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

  get '/create_account' do
  erb :account_creation
  end

  post '/create_account' do
    session[:account] = Account.create(params[:username], params[:email], params[:mob], params[:password])
    redirect '/creation_confirmation'
  end

  get '/creation_confirmation' do
    erb session[:account]
  end

  get '/log_in' do
    erb :login
  end

  post '/log_in' do

    session[:logged_in] = Account.valid_account(params[:username], params[:password])
    session[:current_username] = params[:username] if session[:logged_in] == :login_successful
    p session[:logged_in]
    redirect '/login_confirmation'
  end

  get '/login_confirmation' do
    erb session[:logged_in]
  end

  run! if app_file == $0
end