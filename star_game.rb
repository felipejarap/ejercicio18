#require_relative 'account_manager'
require_relative 'casino'
require_relative 'game_table'
require_relative 'data_manager'

# Recuperar toda la información desde el usuario - Inicial


# Inicializar los objetos
data_manager = DataManager.new("./casino.txt")
casino = data_manager.initialize_casino

puts casino.name
puts casino.tables.length
casino.show_tables

# Iniciar el programa