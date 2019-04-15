class Casino

  attr_accessor :name
  attr_accessor :tables

  def initialize(name,tables = [])
    @name = name
    @tables = tables
  end

  def show_tables
    @tables.each do |table|
      puts table.name
    end  
  end  

end
