describe Truck do
  let (:my_truck){ Truck.new(4) }

  it 'has a capacity when initialized' do
    expect(my_truck.capacity).to eq(4)
  end

  it 'does not have any boxes in it when initialized' do
    expect(my_truck.occupants.empty?).to be(true)
  end

  describe '#add' do
    context 'truck has available spaces' do
      it 'adds a box of an occupant to the truck' do
        my_truck.add("Teddy", "Rubin")
        my_truck.add("Igor", "Zuev")
        my_truck.add("Pete", "Lenon")
        expect(my_truck.occupants.size).to be(3)
        expect(my_truck.occupants[0].first_name).to eq("Teddy")
        expect(my_truck.occupants[1].last_name).to eq("Zuev")
        expect(my_truck.occupants[2].first_name).to eq("Pete")
      end
    end

    context 'truck is full' do
      it 'does not add a box and raises an error message' do
        my_truck.add("Teddy", "Rubin")
        my_truck.add("Igor", "Zuev")
        my_truck.add("Pete", "Lenon")
        my_truck.add("Elsa", "Sun")
        expect(my_truck.occupants.size).to be(4)
        expect(my_truck.occupants[0].first_name).to eq("Teddy")
        expect(my_truck.occupants[1].last_name).to eq("Zuev")
        expect{my_truck.add("Andrew", "Jonson")}.to raise_error(NoAvailablePlace, "No place is available at this time")
      end
    end
  end

  describe '#remove' do
    it 'removes all the boxes of the occupant' do
      my_truck.add("Teddy", "Rubin")
      my_truck.add("Teddy", "Rubin")
      my_truck.add("Teddy", "Rubin")
      my_truck.add("Igor", "Zuev")
      my_truck.remove("Teddy", "Rubin")
      expect(my_truck.occupants.size).to eq(1)
      expect(my_truck.occupants[0].first_name).to eq("Igor")
      expect(my_truck.full?).to be(false)
    end
  end
end
