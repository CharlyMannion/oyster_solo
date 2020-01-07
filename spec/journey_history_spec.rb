require 'journey_history'

describe JourneyHistory do

  describe '#initialize' do
    subject(:jhist) { described_class.new }
    let(:journey) { double :journey }

    it 'should be empty of journeys when created' do
      expect(jhist.journeys).to eq([])
    end

    it 'should add a complete journey (object) to its journeys' do
      jhist.record(journey)
      expect(jhist.journeys).to include(journey)
    end
  end
end
