module AddRemove

  def full?
    @occupants.size >= @capacity
  end

  def add(first_name, last_name)
    if !full?
      @occupants << Occupant.new(first_name, last_name)
    else
      raise NoAvailablePlace.new('No place is available at this time')
    end
  end

  def remove(first_name, last_name)
    @occupants.reverse_each do |occupant|
       if occupant.first_name == first_name && occupant.last_name == last_name
         @occupants.delete(occupant)
       end
    end
  end
end
