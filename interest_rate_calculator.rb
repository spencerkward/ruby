class InterestRateCalculator
  def calculate_interest amount
    amount * interest(amount) / 100
  end

  def interest amount
    return 1 if amount < 1000
    return 1.5 if amount < 2000
    return 2
  end
end

