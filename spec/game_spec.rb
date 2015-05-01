require 'spec_helper'

describe Game do
  describe 'Player board are created' do
    before :each do
      @game =  Game.new
    end

    it 'player1 and player2 board has been created' do
      player1_board = @game.player1_board
      expect(has_empty_board(player1_board)).to be(true)
      player2_board = @game.player2_board
      expect(has_empty_board(player2_board)).to be(true)
    end
  end
end

def has_empty_board(board)
  return false if board.nil?

  grid = board.grid
  return false if grid.nil?

  for i in 0...grid.length
    for j in 0...grid[i].length
      return false if grid[i][j] != '-'
    end
  end
  return true
end