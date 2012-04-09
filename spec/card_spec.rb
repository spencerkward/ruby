require 'card'

describe Card do
  before :each do
    @card = Card.new('do something')
    @card.state = :some_state
  end

  it 'should be able to convert to and from a string' do
    Card.from_s(@card.to_s).should == @card
  end
end
