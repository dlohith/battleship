class Board

  def initialize()
    create_board
  end
  @@length = 10
  @@grid = Array.new(@@length){ Array.new(@@length)}

  def length
    @@length
  end

  def grid
    @@grid
  end

  def create_board
    for i in 0...@@grid.length
      for j in 0...@@grid[i].length
        @@grid[i][j] = "-"
      end
    end
  end

  def place_on_board(type,is_horizonatal,is_vertical,row_index, col_index)
    raise "either horizontal or veritical should be true" if is_horizonatal== false && is_vertical == false

    raise "Both horizontal or veritical is true" if is_horizonatal== true && is_vertical == true

    case type
    when 'aircraft_carrier'
      aircraft_carrier = AircraftCarrier.new
      place_ship aircraft_carrier,is_horizonatal,is_vertical,row_index, col_index
    when 'battle_ship'
      battle_ship = Battleship.new
      place_ship battle_ship,is_horizonatal,is_vertical,row_index, col_index
    when 'destroyer'
      destroyer = Destroyer.new
      place_ship destroyer,is_horizonatal,is_vertical,row_index, col_index
    when 'patrol_boat'
      patrol_boat = PatrolBoat.new
      place_ship patrol_boat,is_horizonatal,is_vertical,row_index, col_index
    when 'submarine'
      submarine = Submarine.new
      place_ship submarine,is_horizonatal,is_vertical,row_index, col_index
    else

    end

  end

  def place_ship(ship,is_horizontal,is_vertical,row_index, col_index)
    if is_vertical == true
      place_ship_veritical ship, row_index, col_index
    elsif is_horizontal == true
      place_ship_horizontal ship, row_index, col_index
    end
  end

  def place_aircraft_carrier
    aircraft_carrier = get_aircraft_carrier
    content = aircraft_carrier.content
    for i in 0...content.length
      @@grid[0][i] =  content[i]
    end
  end

  def place_aircraft_carrier_first_location
    aircraft_carrier = get_aircraft_carrier
    content = aircraft_carrier.content
    for i in 0...content.length
      @@grid[0][i] =  content[i]
    end
  end

  def place_aircraft_carrier_horizontal(row_index, col_index)
    aircraft_carrier = get_aircraft_carrier
    content = aircraft_carrier.content
    for i in 0...content.length
      @@grid[row_index][col_index+i] =  content[i]
    end
  end

  def place_aircraft_carrier_veritical(row_index, col_index)
    aircraft_carrier = get_aircraft_carrier
    content = aircraft_carrier.content
    for i in 0...content.length
      @@grid[row_index+i][col_index] =  content[i]
    end
  end

  def place_ship_horizontal(ship,row_index, col_index)
    content = ship.content

    raise 'No space horizontally to the right'  if row_index + content.length > 10

    for i in 0...content.length
      raise 'Your placing on another ship spot' if @@grid[row_index][col_index+i] != '-'
    end

    for i in 0...content.length
      @@grid[row_index][col_index+i] =  content[i]
    end
  end

  def place_ship_veritical(ship,row_index, col_index)
    content = ship.content
    raise 'No space veritically to the down'  if col_index + content.length > 10

    for i in 0...content.length
      raise 'Your placing on another ship spot' if @@grid[row_index+i][col_index] != '-'
    end
    for i in 0...content.length
      @@grid[row_index+i][col_index] =  content[i]
    end
  end

  def get_aircraft_carrier
    aircraft_carrier = AircraftCarrier.new
    aircraft_carrier
  end

  def display_board
    for i in 0...@@grid.length
      for j in 0...@@grid[i].length
        print "#{@@grid[i][j]} "
      end
      puts "\n";
    end
  end
end