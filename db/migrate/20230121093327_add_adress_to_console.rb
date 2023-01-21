class AddAdressToConsole < ActiveRecord::Migration[7.0]
  def change
    add_column :consoles, :address, :text
  end
end
