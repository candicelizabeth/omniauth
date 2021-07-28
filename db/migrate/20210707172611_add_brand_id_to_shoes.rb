class AddBrandIdToShoes < ActiveRecord::Migration[6.1]
  def change
    add_column :shoes, :brand_id, :integer
  end
end
