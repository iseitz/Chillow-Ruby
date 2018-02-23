
class Dwelling
  attr_reader :address, :city_or_town, :state, :zip_code

  def initialize(details_hash)
    @address = details_hash[:address]
    @city_or_town = details_hash[:city_or_town]
    @state = details_hash[:state]
    @zip_code = details_hash[:zip_code]
  end

end
