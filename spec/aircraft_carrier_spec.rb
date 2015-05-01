require 'spec_helper'


describe AircraftCarrier do
  context 'Class exist ?' do
    it 'create an AircraftCarrier object' do
      AircraftCarrier.new
    end
  end

  describe 'AircraftCarrier characteristics' do
    before :each do
      @aircraft_carrier =  AircraftCarrier.new
    end

    it 'AircraftCarrier length is 5' do
      expect(@aircraft_carrier.length).to eq(5)
    end


    it 'AircraftCarrier place holder is AAAAA' do
      content = ['A','A','A','A','A']
      expect(@aircraft_carrier.content).to eq(content)
    end

  end
end