require 'oyster_card'

describe Oystercard do
  let(:oyster_card) { Oystercard.new }
  it 'instantiates a class' do
    expect(subject).to be_kind_of(Oystercard)
  end

  it 'includes a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  context '#top_up' do
    it 'can be topped up' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
    it 'cannot be topped up more than £90' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect{ subject.top_up 1 }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
    end
  end
  context '#deduct' do
    it 'deducts amount from balance' do
      subject.top_up(20)
      expect{ subject.deduct 3 }.to change{ subject.balance }.by -3
    end
  end
end