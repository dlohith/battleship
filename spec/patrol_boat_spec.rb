require 'spec_helper'


describe PatrolBoat do
  context 'Class exist ?' do
    it 'create an PatrolBoat object' do
      PatrolBoat.new
    end
  end

  describe 'PatrolBoat characteristics' do
    before :each do
      @patrol_boat =  PatrolBoat.new
    end

    it 'PatrolBoat length is 2' do
      expect(@patrol_boat.length).to eq(2)
    end


    it 'PatrolBoat place holder is PP' do
      content = ['P','P']
      expect(@patrol_boat.content).to eq(content)
    end

  end
end