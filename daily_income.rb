class DailyIncome

  attr_accessor :amount
  attr_accessor :day

  def initialize(amount = 0 ,day = nil)
    @amount = amount
    @day = day
  end
end