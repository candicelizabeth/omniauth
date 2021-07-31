class AddUserIdToShoes < ActiveRecord::Migration[6.1]
  def change
    add_column :shoes, :user_id, :integer
  end
end
