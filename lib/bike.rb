class Bike
attr_accessor :broken

  def initialize
    @broken = false
  end

  def working?
    true unless broken
  end
end
