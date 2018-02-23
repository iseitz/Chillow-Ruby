require 'spec_helper'

describe Dwelling do
 let(:my_dwelling) { Dwelling.new({address: "22 avenue rose", city_or_town: "Boston", state: "MA", zip_code: "02101"}) }

  it 'has an address' do
    expect(my_dwelling.address).to eq("22 avenue rose")
  end

  it 'has a city or town name' do
    expect(my_dwelling.city_or_town).to eq("Boston")
  end

  it 'has a state' do
    expect(my_dwelling.state).to eq("MA")
  end

  it 'has a zip code' do
    expect(my_dwelling.zip_code).to eq("02101")
  end

end
