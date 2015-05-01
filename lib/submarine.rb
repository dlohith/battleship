class Submarine
  @@length = 3

  def length
    @@length
  end

  def content
    Array.new(@@length, 'S')
  end
end