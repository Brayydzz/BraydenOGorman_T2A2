class Condition < ApplicationRecord
    has_many :equipment_listings, dependent: :destroy
end
