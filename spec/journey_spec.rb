require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:barrier1) { double :barrier }


  describe '#initalize' do
    it 'should have an empty entry barrier' do
      expect(journey.entry_barrier).to eq(nil)
    end
    it 'should have an empty exit barrier' do
      expect(journey.exit_barrier).to eq(nil)
    end
  end

  describe '#start_at' do
    it 'should set the entry barrier' do
      journey.start_at(barrier1)
        expect(journey.entry_barrier).to eq(barrier1)
    end
  end
end
