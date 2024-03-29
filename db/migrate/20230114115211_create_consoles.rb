class CreateConsoles < ActiveRecord::Migration[7.0]
  def change
    create_table :consoles do |t|
      t.string :name
      t.integer :year
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
