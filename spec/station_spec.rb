require 'station'

describe Station do
  subject(:station) { described_class.new }

  describe 'initialize' do
    it 'should have a zone' do
      expect(subject.zone).to eq(nil)
    end

    describe '#zone' do
      it 'should be possible to change the zone' do
        subject.zone = 1
        expect(subject.zone).to eq(1)
      end
    end
  end
end
