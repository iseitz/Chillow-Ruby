require_relative 'dwelling'
require_relative 'occupant'
require_relative 'no_available_place'
require_relative 'add_remove'

class Apartment < Dwelling
  include AddRemove
  attr_accessor :address, :city_or_town, :state, :zip_code, :capacity, :occupants
  attr_reader  :rent, :lease_start_date, :lease_end_date

  def initialize(apartment_hash)
    @rent = apartment_hash[:rent]
    @lease_start_date = apartment_hash[:lease_start_date]
    @lease_end_date = apartment_hash[:lease_end_date]
    @occupants = []
    @capacity = 5
  end


end
