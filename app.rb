# app.rb

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :homepage
end

get '/:move' do
  moves = %w[rock paper scissors]
  @user_move = params[:move]

  redirect to('/') unless moves.include?(@user_move)

  @comp_move = moves.sample
  @outcome = determine_outcome(@user_move, @comp_move)

  erb :we_play
end

def determine_outcome(user_move, comp_move)
  return 'tied' if user_move == comp_move

  win_conditions = {
    'rock' => 'scissors',
    'paper' => 'rock',
    'scissors' => 'paper'
  }

  return 'won' if win_conditions[user_move] == comp_move

  'lost'
end
