require 'oyster_card'

describe Oystercard do
  it 'instantiates a class' do
  oyster_card = Oystercard.new
    expect(oyster_card).to be_kind_of(Oystercard)
  end

  it 'includes a balance' do
    expect(oyster_card).to respond_to(:balance)
  end
end