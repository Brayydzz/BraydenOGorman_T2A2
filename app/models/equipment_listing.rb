class EquipmentListing < ApplicationRecord
  belongs_to :user
  belongs_to :item_type
  belongs_to :condition
  belongs_to :address
end
