class CreateShoes < ActiveRecord::Migration[6.1]
  def change
    create_table :shoes do |t|
      t.string :color
      t.float :price
      t.string :condition
      t.timestamps
    end
  end
end
