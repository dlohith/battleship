require 'spec_helper'


describe Submarine do
  context 'Class exist ?' do
    it 'create an Submarine object' do
      Submarine.new
    end
  end

  describe 'Submarine characteristics' do
    before :each do
      @submarine =  Submarine.new
    end

    it 'Submarine length is 3' do
      expect(@submarine.length).to eq(3)
    end


    it 'Submarine place holder is SSS' do
      content = ['S','S','S']
      expect(@submarine.content).to eq(content)
    end

  end
end