class GameTable

  attr_accessor :name
  attr_accessor :game_type
  attr_accessor :incomes

  def initialize(game_name,game_type, incomes = [])
    @name = game_name
    @game_type = game_type
    @incomes = incomes
  end

  def total_income
    amount = 0
    @incomes.each do |income|
      amount += income.amount
    end

    amount
  end

  def avg_income
    if incomes.empty?
      0
    else
      self.total_income/self.incomes.length
    end
  end  
end
