class CreatePurchasers < ActiveRecord::Migration[5.1]
  def change
    create_table :purchasers do |t|
      t.string :name
      t.integer :count

      t.timestamps
    end
  end
end
