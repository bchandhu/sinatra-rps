class RockPaperScissors
  class InvalidMoveError < StandardError; end

  attr_reader :player_move, :comp_move, :outcome

  MOVES = ["rock" , "paper" , "scissors"]

  WINNING_OUTCOMES = {
    "rock" => "scissors",
    "paper" => "rock",
    "scissors" => "paper"
  }

  def play(player_move)
    raise InvalidMoveError.new("Invalid move '#{player_move}'. Sorry, you can't do that.") unless move_valid?(player_move)

    @comp_move = MOVES.sample
    @player_move = player_move

    if @player_move == @comp_move
      @outcome = "tied"
    elsif WINNING_OUTCOMES[@player_move] == @comp_move
      @outcome = "win"
    else
      @outcome = "lost"
    end

    @outcome
  end

  def move_valid?(move)
    MOVES.any?(move)
  end
end
