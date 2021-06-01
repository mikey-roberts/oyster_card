require 'oyster_card'

describe Oystercard do
  let(:oyster_card) { Oystercard.new }
  it 'instantiates a class' do
    expect(oyster_card).to be_kind_of(Oystercard)
  end

  it 'includes a balance' do
    expect(oyster_card).to respond_to(:balance)
  end

  it 'includes a balance of 0' do
    expect(oyster_card.balance).to eq(0)
  end

  context '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'can be topped up' do
      oyster_card.top_up(10)
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end
end