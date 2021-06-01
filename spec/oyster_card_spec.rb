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

  it 'incldues a balance of 0' do
    oyster_card = Oystercard.new
    expect(oyster_card.balance).to eq(0)
  end
end