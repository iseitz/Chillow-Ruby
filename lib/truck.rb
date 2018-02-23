class Truck
  include AddRemove
  attr_reader :capacity
  attr_accessor :occupants

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end
end
