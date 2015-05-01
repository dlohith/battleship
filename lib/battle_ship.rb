class Battleship

  @@length = 4

  def length
    @@length
  end

  def content
    Array.new(@@length, 'B')
  end

end
