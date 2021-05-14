class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :unit_num
      t.string :street_num
      t.string :street
      t.string :suburb
      t.string :postcode

      t.timestamps
    end
  end
end
