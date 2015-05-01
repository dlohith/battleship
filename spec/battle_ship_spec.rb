require 'spec_helper'


describe Battleship do
  context 'Class exist ?' do
    it 'create an Battleship object' do
      Battleship.new
    end
  end

  describe 'Battleship characteristics' do
    before :each do
      @battle_ship =  Battleship.new
    end

    it 'Battleship length is 4' do
      expect(@battle_ship.length).to eq(4)
    end


    it 'Battleship place holder is BBBB' do
      content = ['B','B','B','B']
      expect(@battle_ship.content).to eq(content)
    end

  end
end