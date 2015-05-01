class Destroyer

  @@length = 3

  def length
    @@length
  end

  def content
    Array.new(@@length, 'D')
  end
end