require 'oyster_card'

describe OysterCard do
  it 'instantiates a class' do
  oyster_card = OysterCard.new
    expect(oyster_card).to be_kind_of(OysterCard)
  end

  it 'includes a balance' do
    expect(oyster_card).to respond_to(:balance)
  end
end