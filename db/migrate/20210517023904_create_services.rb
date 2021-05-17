class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.float :price
      t.string :location

      t.timestamps
    end
  end
end
