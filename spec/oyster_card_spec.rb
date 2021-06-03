require 'oyster_card'

describe Oystercard do
  let(:oyster_card) { Oystercard.new }

  it 'instantiates a class' do
    expect(subject).to be_kind_of(Oystercard)
  end

  it 'includes a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'Is in journey' do
    expect(subject).not_to be_in_journey 
  end 

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  context '#top_up' do
    it 'can be topped up' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
    it 'cannot be topped up more than £90' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end
  # context '#deduct' do
  #   it 'cannot go below £1' do 
  #       minimum_balance = Oystercard::MINIMUM_BALANCE
  #       subject.top_up(10)
  #       expect{ subject.deduct 11 }.to raise_error "Minimum balance of #{minimum_balance} exceeded"
  #   end
  # end
  #   it 'deducts amount from balance' do
  #     subject.top_up(20)
  #     expect{ subject.deduct 3 }.to change{ subject.balance }.by -3
  #   end
  let(:station){ double :station }
  
  context '#touch_in' do
    it 'Is now in journey' do
    subject.top_up(10)
    subject.touch_in(station)
    expect(subject).to be_in_journey
    end
    it 'will not touch in if below minimum balance' do
      expect { subject.touch_in(station) }.to raise_error "Insufficient balance to touch in"
    end
  end

  context '#touch_out' do
    it 'Is no longer in journey' do
    subject.top_up(10)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject).not_to be_in_journey
    end
    it 'charge made on touch out' do
      subject.top_up(10)
      expect { subject.touch_out(station) }.to change{ subject.balance }.by( -Oystercard::MINIMUM_CHARGE )
    end
  end
  context '#entry_station' do 
    it 'stores the entry station' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it 'stores exit station' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  it 'stores a journey' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to include journey
  end
end