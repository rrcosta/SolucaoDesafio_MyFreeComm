class CreateRevenues < ActiveRecord::Migration[5.1]
  def change
    create_table :revenues do |t|
      t.string :name
      t.float :value

      t.timestamps
    end
  end
end
