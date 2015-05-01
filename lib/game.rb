class Game

  @@player1_board = nil
  @@player2_board = nil

  def initialize()
    @@player1_board = Board.new
    @@player2_board = Board.new
  end

  def player1_board
    @@player1_board
  end

  def player2_board
    @@player2_board
  end

end