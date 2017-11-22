class CreateExampleInputs < ActiveRecord::Migration[5.1]
  def change
    create_table :example_inputs do |t|
      t.string :purchasername
      t.string :itemdescription
      t.float :itemprice
      t.integer :purchasecount
      t.string :merchantaddress
      t.string :merchantname

      t.timestamps
    end
  end
end
