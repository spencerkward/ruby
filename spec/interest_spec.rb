require 'interest_rate_calculator'

describe InterestRateCalculator do
  before :each do
    @calculator = InterestRateCalculator.new
  end

  it 'should use a rate of 1 percent for balances below 1000 pounds' do
    @calculator.calculate_interest(100).should == 1.00
  end
  it 'should use a rate of 1.5 percent for balances below 2000 pounds' do
    @calculator.calculate_interest(1500).should == 22.5
  end
  it 'should use a rate of 2.0 percent for balances above 3000 pounds' do
    @calculator.calculate_interest(4000).should == 80.00
  end
end
