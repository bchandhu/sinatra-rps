require "sinatra"
require "sinatra/reloader"
require_relative "services/rock_paper_scissors"

get("/") do
  erb(:home)
end

get("/:move") do
  rps = RockPaperScissors.new
  rps.play(params.fetch("move"))
  
  @player_move = rps.player_move
  @comp_move = rps.comp_move
  @outcome = rps.outcome

  erb(:move)
rescue RockPaperScissors::InvalidMoveError => e
  @error = e.message
  erb(:invalid_move)
end
