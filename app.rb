require 'sinatra/base'

class Battle < Sinatra::Base

enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    session[:player_1_points] = 0
    session[:player_2_points] = 0
    redirect '/play'
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    @player_1_points = session[:player_1_points]
    @player_2_points = session[:player_2_points]
    erb(:play)
  end

  get '/attack' do
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
