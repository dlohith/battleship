require 'spec_helper'


describe Destroyer do
  context 'Class exist ?' do
    it 'create an Destroyer object' do
      Destroyer.new
    end
  end

  describe 'Destroyer characteristics' do
    before :each do
      @destroyer =  Destroyer.new
    end

    it 'Destroyer length is 3' do
      expect(@destroyer.length).to eq(3)
    end


    it 'Destroyer place holder is DDD' do
      content = ['D','D','D']
      expect(@destroyer.content).to eq(content)
    end

  end
end