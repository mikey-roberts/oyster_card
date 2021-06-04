require 'journey'
describe Journey do
  let(:station) { double :station, zone: 1 }
  let(:other_station) { double :other_station, zone: 3 }
  describe '#finish' do
    it 'returns true if they have not completed a journey' do
      expect(subject.finish?).to eq true
    end
    it 'turns complete true if a journey has been completed' do
      subject.entry_station = station
      subject.exit_station(other_station)
      subject.finish?
      subject.fare
      expect(subject.complete?).to eq true
    end
  end
  it "knows if a journey is not complete" do
    expect(subject.complete?).to eq false
  end
  describe '#fare' do
    it 'returns a penalty fare' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end
  context 'given an entry station' do
    subject {described_class.new(station)}
    it 'has an entry station' do
      expect(subject.entry_station).to eq station
    end
    it "returns a penalty fare if no exit station given" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
    context 'given an exit station' do
      before do
        subject.finish?
      end
      it 'calculates a fare' do
        expect(subject.fare).to eq 6
      end
    end
    describe '#in_journey?' do
      # it 'updates the card to be touched out' do
      #   expect(subject.in_journey?).to eq false
      # end
      it 'updates the card to be touched on' do
        expect(subject.in_journey?).to eq true
      end
    end
  end
end