class CreatePurchaser < ActiveRecord::Migration[7.0]
  def change
    create_table :purchasers do |t|
      t.string :name

      t.timestamps
    end
  end
end
