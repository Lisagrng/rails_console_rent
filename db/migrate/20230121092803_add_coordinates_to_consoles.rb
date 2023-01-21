class AddCoordinatesToConsoles < ActiveRecord::Migration[7.0]
  def change
    add_column :consoles, :latitude, :float
    add_column :consoles, :longitude, :float
  end
end
