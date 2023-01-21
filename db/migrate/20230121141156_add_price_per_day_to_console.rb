class AddPricePerDayToConsole < ActiveRecord::Migration[7.0]
  def change
    add_column :consoles, :price_per_day, :integer
  end
end
