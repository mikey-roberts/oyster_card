require 'oyster_card'

describe Oystercard do
  it 'instantiates a class' do
    oyster_card = Oystercard.new
    expect(oyster_card).to be_kind_of(Oystercard)
  end

  it 'includes a balance' do
    oyster_card = Oystercard.new
    expect(oyster_card).to respond_to(:balance)
  end

  it 'includes a balance of 0' do
    oyster_card = Oystercard.new
    expect(oyster_card.balance).to eq(0)
  end

  it 'can be topped up' do
    oyster_card = Oystercard.new
    oyster_card.top_up(10)
    expect(oyster_card.balance).to eq(10)
  end
end