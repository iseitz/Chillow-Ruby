require_relative 'dwelling'

class House < Dwelling

  attr_accessor :address, :city_or_town, :state, :zip_code
  attr_reader :asking_price

  def initialize(asking_price)
    @asking_price = asking_price
  end

end
