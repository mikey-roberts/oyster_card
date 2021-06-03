require 'station'
                                          
describe Station do
  
    let(:station) { Station.new(name, zone) }
    let(:name) { 'Old Street'}
    let(:zone) { 1 }

    context '#initialize' do
      it 'equals name and zone' do
        expect(station.name).to eq 'Old Street'
        expect(station.zone).to eq 1
      end
    end
end