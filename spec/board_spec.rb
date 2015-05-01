require 'spec_helper'

describe Board do
  before :each do
    @board =  Board.new
  end

  describe 'board has length 10' do
    it 'board has class instance length with value 10' do
      expect(@board.length).to eq(10)
    end
  end

  describe 'should have a 10x10 game board' do
    it 'has creates game board' do
      @board.create_board
    end
    it 'creates a grid with lengths 10 x 10' do
      expect(@board.grid.length).to be(10)
      expect(@board.grid[2].length).to be(10)
    end
    it 'board should be initialized with empty character -' do
      @board.create_board
      grid = @board.grid
      for i in 0...grid.length
        for j in 0...grid[i].length
          expect(grid[i][j]).to eq('-')
        end
      end
    end
  end

  describe 'place_on_board should handles placement on board' do
    it 'should create a aircraft_carrier object' do
      expect(AircraftCarrier).to receive(:new).and_call_original
      @board.place_on_board 'aircraft_carrier',true,false,0,0
    end
    it 'should create a patrol_boat object' do
      expect(PatrolBoat).to receive(:new).and_call_original
      @board.place_on_board 'patrol_boat',true,false,0,0
    end
    it 'should create a battle_ship object' do
      expect(Battleship).to receive(:new).and_call_original
      @board.place_on_board 'battle_ship',true,false,0,0
    end
    it 'should create a submarine object' do
      expect(Submarine).to receive(:new).and_call_original
      @board.place_on_board 'submarine',true,false,0,0
    end
    it 'should create a destroyer object' do
      expect(Destroyer).to receive(:new).and_call_original
      @board.place_on_board 'destroyer',true,false,0,0
    end
    it 'either horizontal or veritical is not true raise error' do
      expect{@board.place_on_board('destroyer',false,false,0,0)}.to raise_error "either horizontal or veritical should be true"
    end
    it 'Both horizontal or veritical is true raise error' do
      expect{@board.place_on_board('destroyer',true,true,0,0)}.to raise_error "Both horizontal or veritical is true"
    end

    it 'cals place_ship' do
      aircraft = AircraftCarrier.new
      expect(AircraftCarrier).to receive(:new).and_return aircraft
      expect_any_instance_of(Board).to receive(:place_ship).with( aircraft, true, false,0,0 ).and_call_original
      @board.place_on_board 'aircraft_carrier',true,false,0,0
    end

    it 'place horizontal' do
      expect_any_instance_of(Board).to receive(:place_ship_horizontal).and_call_original
      @board.place_on_board 'aircraft_carrier',true,false,0,0
    end

    it 'place veritical' do
      expect_any_instance_of(Board).to receive(:place_ship_veritical).and_call_original
      @board.place_on_board 'aircraft_carrier',false,true,0,0
    end
    it 'place horizontally at location 0,0' do
      @board.place_on_board 'aircraft_carrier',true,false,0,0
      grid = @board.grid
      for i in 0...5
        expect(grid[0][i]).to eq('A')
      end
    end

    it 'place veritically at location 0,0' do
      @board.place_on_board 'aircraft_carrier',false,true,0,0
      grid = @board.grid
      for i in 0...5
        expect(grid[i][0]).to eq('A')
      end
    end

    it 'place horizontally at location 4,5' do
      @board.place_on_board 'aircraft_carrier',true,false,4,5
      grid = @board.grid
      for i in 0...5
        expect(grid[4][5+i]).to eq('A')
      end
    end

    it 'place veritically at location 4,5' do
      @board.place_on_board 'aircraft_carrier',false,true,4,5
      grid = @board.grid
      for i in 0...5
        expect(grid[4+i][5]).to eq('A')
      end
    end
  end

  describe 'should allow the player to place 1 aircraft carrier (size 5)' do
    it 'call for place aircraft carrier' do
      @board.place_aircraft_carrier
    end

    it 'gets aircraft_carrier' do
      expect_any_instance_of(Board).to receive(:get_aircraft_carrier).and_call_original
      @board.place_aircraft_carrier
    end

       it 'place horizontally at location 0,0' do
      @board.place_on_board 'aircraft_carrier',true,false,0,0
      grid = @board.grid
      for i in 0...5
        expect(grid[0][i]).to eq('A')
      end
    end

    it 'place veritically at location 0,0' do
      @board.place_on_board 'aircraft_carrier',false,true,0,0
      grid = @board.grid
      for i in 0...5
        expect(grid[i][0]).to eq('A')
      end
    end

    it 'place horizontally at location 4,5' do
      @board.place_on_board 'aircraft_carrier',true,false,4,5
      grid = @board.grid
      for i in 0...5
        expect(grid[4][5+i]).to eq('A')
      end
    end

    it 'place veritically at location 4,5' do
      @board.place_on_board 'aircraft_carrier',false,true,4,5
      grid = @board.grid
      for i in 0...5
        expect(grid[4+i][5]).to eq('A')
      end
    end
  end

  describe 'It should allow the player to place 1 battleship (size 4)' do

    it 'cals Battleship' do
      battleship = Battleship.new
      expect(Battleship).to receive(:new).and_return battleship
      @board.place_on_board 'battle_ship',true,false,0,0
    end

    it 'place horizontally at location 0,0' do
      @board.place_on_board 'battle_ship',true,false,0,0
      grid = @board.grid
      for i in 0...4
        expect(grid[0][i]).to eq('B')
      end
    end

    it 'place veritically at location 0,0' do
      @board.place_on_board 'battle_ship',false,true,0,0
      grid = @board.grid
      for i in 0...4
        expect(grid[i][0]).to eq('B')
      end
    end

    it 'place horizontally at location 4,5' do
      @board.place_on_board 'battle_ship',true,false,4,5
      grid = @board.grid
      for i in 0...4
        expect(grid[4][5+i]).to eq('B')
      end
    end

    it 'place veritically at location 4,5' do
      @board.place_on_board 'battle_ship',false,true,4,5
      grid = @board.grid
      for i in 0...4
        expect(grid[4+i][5]).to eq('B')
      end
    end
  end

  describe 'It should allow the player to place 1 submarine (size 3)' do

    it 'cals Submarine' do
      submarine = Submarine.new
      expect(Submarine).to receive(:new).and_return submarine
      @board.place_on_board 'submarine',true,false,0,0
    end

    it 'place horizontally at location 0,0' do
      @board.place_on_board 'submarine',true,false,0,0
      grid = @board.grid
      for i in 0...3
        expect(grid[0][i]).to eq('S')
      end
    end

    it 'place veritically at location 0,0' do
      @board.place_on_board 'submarine',false,true,0,0
      grid = @board.grid
      for i in 0...3
        expect(grid[i][0]).to eq('S')
      end
    end

    it 'place horizontally at location 4,5' do
      @board.place_on_board 'submarine',true,false,4,5
      grid = @board.grid
      for i in 0...3
        expect(grid[4][5+i]).to eq('S')
      end
    end

    it 'place veritically at location 4,5' do
      @board.place_on_board 'submarine',false,true,4,5
      grid = @board.grid
      for i in 0...3
        expect(grid[4+i][5]).to eq('S')
      end
    end
  end

  describe ' should allow the player to place 1 patrol boat (size 2)
' do

    it 'cals PatrolBoat' do
      patrol_boat = PatrolBoat.new
      expect(PatrolBoat).to receive(:new).and_return patrol_boat
      @board.place_on_board 'patrol_boat',true,false,0,0
    end

    it 'place horizontally at location 0,0' do
      @board.place_on_board 'patrol_boat',true,false,0,0
      grid = @board.grid
      for i in 0...2
        expect(grid[0][i]).to eq('P')
      end
    end

    it 'place veritically at location 0,0' do
      @board.place_on_board 'patrol_boat',false,true,0,0
      grid = @board.grid
      for i in 0...2
        expect(grid[i][0]).to eq('P')
      end
    end

    it 'place horizontally at location 4,5' do
      @board.place_on_board 'patrol_boat',true,false,4,5
      grid = @board.grid
      for i in 0...2
        expect(grid[4][5+i]).to eq('P')
      end
    end

    it 'place veritically at location 4,5' do
      @board.place_on_board 'patrol_boat',false,true,4,5
      grid = @board.grid
      for i in 0...2
        expect(grid[4+i][5]).to eq('P')
      end
    end
  end

  describe 'It should allow the player to place 1 destroyer (size 3)' do

    it 'cals Destroyer' do
      destroyer = Destroyer.new
      expect(Destroyer).to receive(:new).and_return destroyer
      @board.place_on_board 'destroyer',true,false,0,0
    end

    it 'place horizontally at location 0,0' do
      @board.place_on_board 'destroyer',true,false,0,0
      grid = @board.grid
      for i in 0...3
        expect(grid[0][i]).to eq('D')
      end
    end

    it 'place veritically at location 0,0' do
      @board.place_on_board 'destroyer',false,true,0,0
      grid = @board.grid
      for i in 0...3
        expect(grid[i][0]).to eq('D')
      end
    end

    it 'place horizontally at location 4,5' do
      @board.place_on_board 'destroyer',true,false,4,5
      grid = @board.grid
      for i in 0...3
        expect(grid[4][5+i]).to eq('D')
      end
    end

    it 'place veritically at location 4,5' do
      @board.place_on_board 'destroyer',false,true,4,5
      grid = @board.grid
      for i in 0...3
        expect(grid[4+i][5]).to eq('D')
      end
    end
  end

  describe 'should throw an error if a ship is placed in a spot where another ship has been placed'do
    it 'raise error should ship placed at start position of another ship horizontally' do
      @board.place_on_board 'aircraft_carrier',true,false,0,0
      expect{@board.place_on_board 'aircraft_carrier',true,false,0,0}.to raise_error 'Your placing on another ship spot'
    end
    it 'raise error should ship placed at start position of another ship veritically' do
      @board.place_on_board 'aircraft_carrier',false,true,0,0
      expect{@board.place_on_board 'aircraft_carrier',false,true,0,0}.to raise_error 'Your placing on another ship spot'
    end
    it 'raise error should ship placed at one position of another ship horizontally' do
      @board.place_on_board 'aircraft_carrier',true,false,0,0
      expect{@board.place_on_board 'aircraft_carrier',false,true,0,0}.to raise_error 'Your placing on another ship spot'
    end
    it 'raise error should ship placed at one position of another ship veritically' do
      @board.place_on_board 'aircraft_carrier',false,true,0,0
      expect{@board.place_on_board 'aircraft_carrier',true,false,0,0}.to raise_error 'Your placing on another ship spot'
    end
  end

  describe 'should throw an error if a ship is placed outside the bounds of the board' do
    it 'raise error should out of bound horizontally to right' do
      expect{@board.place_on_board 'aircraft_carrier',true,false,7,0}.to raise_error 'No space horizontally to the right'
    end

    it 'raise error should out of bound horizontally to right' do
      expect{@board.place_on_board 'aircraft_carrier',false,true,0,7}.to raise_error 'No space veritically to the down'
    end
  end

  describe 'Board #get_aircraft_carrier' do
    it 'returns a AircraftCarrier object' do
      aircraft_carrier = @board.get_aircraft_carrier
      expect(aircraft_carrier.instance_of? AircraftCarrier).to be(true)
    end
  end
end