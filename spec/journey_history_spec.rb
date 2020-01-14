require 'journey_history'

describe JourneyHistory do

  describe '#initialize' do
    subject(:jhist) { described_class.new }
    let(:station_double) { double :station, zone: 1, name: :dalston }
    let(:station_double_two) { double :station, zone: 1, name: :shoreditch }
    let(:journey) { double :journey }
    let(:barrier) { double :barrier, station: station_double_two }
    let(:barrier_two) { double :barrier, station: station_double }
    let(:journey_double) { double :journey, entry_barrier: barrier, exit_barrier: barrier_two, complete: true }
    let(:journey_double_two) { double :journey, entry_barrier: barrier_two, exit_barrier: barrier, complete: true }

    it 'should be empty of journeys when created' do
      expect(jhist.journeys).to eq([])
    end

    it 'should add a complete journey (object) to its journeys' do
      jhist.record(journey)
      expect(jhist.journeys).to include(journey)
    end

    it 'should have a function to display the journey history to user' do
      jhist.record(journey_double)
      jhist.record(journey_double_two)
      # test = "Journey History: #{jhist.journeys[0].entry_barrier.station.name} - #{jhist.journeys[0].exit_barrier.station.name}; #{jhist.journeys[1].entry_barrier.station.name} - #{jhist.journeys[1].exit_barrier.station.name}"
      test_eq = "Journey History: shoreditch - dalston; dalston - shoreditch"
      expect(jhist.display).to eq(test_eq)
    end
  end
end
