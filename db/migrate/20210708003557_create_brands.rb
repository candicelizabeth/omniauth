class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :year_founded

      t.timestamps
    end
  end
end
