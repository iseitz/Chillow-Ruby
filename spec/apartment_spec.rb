require 'spec_helper'

describe Apartment do

  let (:my_apartment) { Apartment.new( {rent: "1_200", lease_start_date: "01/09/2018", lease_end_date:"31/08/2019"}) }

    it 'has an address' do
      my_apartment.address = "22 avenue rose"
      expect(my_apartment.address).to eq("22 avenue rose")
    end

    it 'has a city or town name' do
      my_apartment.city_or_town = "Boston"
      expect(my_apartment.city_or_town).to eq("Boston")
    end

    it 'has a state' do
      my_apartment.state = "MA"
      expect(my_apartment.state).to eq("MA")
    end

    it 'has a zip code' do
      my_apartment.zip_code = "02101"
      expect(my_apartment.zip_code).to eq("02101")
    end

    it 'has rent per month price' do
      expect(my_apartment.rent).to eq("1_200")
    end

    it 'has begin lease date' do
      expect(my_apartment.lease_start_date).to eq("01/09/2018")
    end

    it 'has lease end date' do
      expect(my_apartment.lease_end_date).to eq("31/08/2019")
    end

  describe '#full?' do
    context 'apartment is full' do
      it 'returns true' do
        my_apartment.capacity = 3
        my_apartment.add_roommate("Teddy", "Rubin")
        my_apartment.add_roommate("Igor", "Zuev")
        my_apartment.add_roommate("Pete", "Lenon")
        expect(my_apartment.full?).to eq(true)
      end
    end

    context 'apartment has available space(s)' do
      it 'returns false' do
        my_apartment.capacity = 2
        expect(my_apartment.full?).to eq(false)
      end
    end
  end

  describe '#add_roommate' do
    context 'apartment has available spaces' do
      it 'adds a roommate to the appartment' do
        my_apartment.capacity = 3
        my_apartment.add_roommate("Teddy", "Rubin")
        my_apartment.add_roommate("Igor", "Zuev")
        my_apartment.add_roommate("Pete", "Lenon")
        expect(my_apartment.occupants.size).to be(3)
        expect(my_apartment.occupants[0].first_name).to eq("Teddy")
        expect(my_apartment.occupants[1].last_name).to eq("Zuev")
        expect(my_apartment.occupants[2].first_name).to eq("Pete")
      end
    end

    context 'apartment is full' do
      it 'does not add a roommate and raises an error message' do
        my_apartment.capacity = 2
        my_apartment.add_roommate("Teddy", "Rubin")
        my_apartment.add_roommate("Igor", "Zuev")
        expect(my_apartment.occupants.size).to be(2)
        expect(my_apartment.occupants[0].first_name).to eq("Teddy")
        expect(my_apartment.occupants[1].last_name).to eq("Zuev")
        expect{my_apartment.add_roommate("Pete", "Lenon")}.to raise_error(NoAvailablePlace, "No place is available at the appartment at this time")
      end
    end
  end

  describe '#remove_roommate' do
    it 'removes a roommate with a given first and last name' do
      my_apartment.capacity = 2
      my_apartment.add_roommate("Teddy", "Rubin")
      my_apartment.add_roommate("Igor", "Zuev")
      my_apartment.remove_roommate("Teddy", "Rubin")
      expect(my_apartment.occupants.size).to eq(1)
      expect(my_apartment.occupants[0].first_name).to eq("Igor")
      expect(my_apartment.full?).to be(false)
    end
  end
end
