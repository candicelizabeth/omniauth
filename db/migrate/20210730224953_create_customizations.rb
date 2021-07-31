class CreateCustomizations < ActiveRecord::Migration[6.1]
  def change
    create_table :customizations do |t|
      t.string :part
      t.string :color
      t.belongs_to :shoe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
