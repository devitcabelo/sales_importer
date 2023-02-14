class CreateItem < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.integer :purchase_count
      t.references :merchant, null: false, foreign_key: true
      t.references :purchaser, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
