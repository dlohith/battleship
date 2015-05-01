class PatrolBoat

@@length = 2

  def length
    @@length
  end

  def content
    Array.new(@@length,'P')
  end
end
