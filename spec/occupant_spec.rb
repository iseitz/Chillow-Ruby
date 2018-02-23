require 'spec_helper'

describe Occupant do
  let(:new_occupant) { Occupant.new("Drew", "Palacheck") }

  it 'is has a first name' do
    expect(new_occupant.first_name).to eq("Drew")
  end

  it 'has a last name' do
    expect(new_occupant.last_name).to eq("Palacheck")
  end
end
