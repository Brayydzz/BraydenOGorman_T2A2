class Address < ApplicationRecord
    has_one :equipment_listing, dependent: :destroy
end
