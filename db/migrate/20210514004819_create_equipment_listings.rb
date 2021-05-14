class CreateEquipmentListings < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item_type, null: false, foreign_key: true
      t.string :title
      t.float :price
      t.text :description
      t.references :condition, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
