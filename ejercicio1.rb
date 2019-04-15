# Crear una clase Table cuyo constructor reciba el nombre de la mesa y las recaudaciones correspondientes de cada día
# Crear un método que permita leer el archivo e instanciar una mesa por línea del archivo
# Crear métodos que permitan:
#           Conocer el mayor valor recaudado, y a que mesa y día corresponde.
#           Calcular el promedio total de lo recaudado por todas las mesas en todos los días.

# Orden: qué nos permiten crear?
# Tratar de tener un método más simple posible para resolver el problema más general posible.
class Table
  attr_accessor :name, :daily_income
  def initialize(name, daily_income)
    @name = name
    @daily_income = daily_income
  end
end
  def read(file_name)
    data = []
    File.open(file_name, 'r') do |file|
      data = file.readlines.map do |prod|
        prod.chomp.split(', ')
      end
      print data
    end
    total_amount = 0
    data.each do |table|
      sum = 0
      sum = table[1].to_i + table[2].to_i + table[3].to_i + table[4].to_i
      total_amount += sum
      puts " La #{table[0]} tiene una recaudación diaria de $#{sum}"
    end
    puts "El monto de recaudación diario consolidado es de $#{total_amount}"
  end
  
  # table_list = []
  # File.open(new_file_name, 'w') do |file|
  #   table_list << Table.new(*ls)
  # end
  # puts "Su archivo '#{new_file_name}' ha sido creado"



# products_list = []
# data = []
# File.open('catalogo.txt', 'r') { |file| data = file.readlines}
# data.each do |prod|
#   ls = prod.chomp.split(', ')
#   #products_list << Product.new(ls[0], ls[1], ls[2], ls[3], ls[4])
#   products_list << Product.new(*ls)
# end


read('casino.txt')