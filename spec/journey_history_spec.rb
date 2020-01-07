require 'journey_history'

describe JourneyHistory do

  describe '#initialize' do
    subject(:jhist) { described_class.new }

    it 'should be empty of journeys when created' do
      expect(jhist.journeys).to eq([])
    end
  end
end
