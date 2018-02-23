describe House do

let (:my_house) { House.new("12_000") }

  it 'has an address' do
    my_house.address = "22 avenue rose"
    expect(my_house.address).to eq("22 avenue rose")
  end

  it 'has a city or town name' do
    my_house.city_or_town = "Boston"
    expect(my_house.city_or_town).to eq("Boston")
  end

  it 'has a state' do
    my_house.state = "MA"
    expect(my_house.state).to eq("MA")
  end

  it 'has a zip code' do
    my_house.zip_code = "02101"
    expect(my_house.zip_code).to eq("02101")
  end

  it 'has asking price' do
    expect(my_house.asking_price).to eq("12_000")
  end
end
