require 'rspec'
require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do
  before :each do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  it 'exists' do
    expect(@vehicle).to be_a(Vehicle)
  end

  it 'has callable attributes' do
    expect(@vehicle.year).to eq("2001")
    expect(@vehicle.make).to eq("Honda")
    expect(@vehicle.model).to eq("Civic")
  end

  it 'can tell if it is speeding and speed' do
    expect(@vehicle.speeding?).to eq(false)

    @vehicle.speed

    expect(@vehicle.speeding?).to eq(true)
  end

  it 'can tell if it has passengers and add passengers' do
    expect(@vehicle.passengers).to eq([])

    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)

    expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
  end

  it 'can tell how many passengers are adults' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)

    expect(@vehicle.num_adults).to eq(2)
  end
end