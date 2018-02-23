require_relative 'dwelling'
require_relative 'occupant'

class Apartment < Dwelling
  attr_accessor :address, :city_or_town, :state, :zip_code, :capacity, :occupants
  attr_reader  :rent, :lease_start_date, :lease_end_date

  def initialize(apartment_hash)
    @rent = apartment_hash[:rent]
    @lease_start_date = apartment_hash[:lease_start_date]
    @lease_end_date = apartment_hash[:lease_end_date]
    @occupants = []
    @capacity = 5
  end

  def full?
    @occupants.size >= @capacity
  end

  def add_roommate(first_name, last_name)
    if !full?
      @occupants << Occupant.new(first_name, last_name)
    else
      raise NoAvailablePlace.new('No place is available at the appartment at this time')
    end
  end

  def remove_roommate(first_name, last_name)
    @occupants.each do |roommate|
       if roommate.first_name == first_name && roommate.last_name == last_name
         @occupants.delete(roommate)
       end
    end
  end
end


class NoAvailablePlace < StandardError
 attr_reader :message

  def initialize(message)
    @message = message
  end
end
