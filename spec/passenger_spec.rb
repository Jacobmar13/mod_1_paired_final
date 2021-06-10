require 'rspec'
require './lib/passenger'

RSpec.describe Passenger do
  before :each do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end
  context '(Iteration 1)' do
    it 'exists' do
      expect(@charlie).to be_a(Passenger)
      expect(@taylor).to be_a(Passenger)
    end

    it 'can check if it\'s an adult' do
      expect(@charlie.adult?).to eq(true)
      expect(@taylor.adult?).to eq(false)
    end

    it 'can assign and check if driver' do
      expect(@charlie.adult?).to eq(false)

      @charlie.drive

      expect(@charlie.driver?).to eq(true)
    end
  end
end