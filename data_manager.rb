require_relative 'casino'
require_relative 'game_table'
require_relative 'daily_income'

class DataManager

  attr_accessor :data

  def initialize(path)
    @data = File.open(path,"r")
  end

  def initialize_casino
    tables = self.initialize_tables
    Casino.new("Full Stack G16 - Casino",tables)
  end  

  def initialize_tables
    tables = []

    @data.each do |data_table|
      parse_data = data_table.split(",")
      table_name = parse_data[0]
      table = GameTable.new(table_name,"")
      parse_data[1..-1].each_with_index do |daily_income,index|
        amount = daily_income
        table.incomes << DailyIncome.new(amount,index+1)
      end

      tables << table  
    end

    tables
  end

end
