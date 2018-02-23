class Box

  attr_reader :owner

  def initialize(first_name, last_name)
    @owner = Occupant.new(first_name, last_name)
  end
end
