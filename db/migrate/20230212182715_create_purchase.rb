class CreatePurchase < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.decimal :gross_income, precision: 8, scale: 2

      t.timestamps
    end
  end
end
