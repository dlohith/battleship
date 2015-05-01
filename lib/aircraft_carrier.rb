class AircraftCarrier

  @@length = 5

  def length
    @@length
  end

  def content
    Array.new(@@length, 'A')
  end

end