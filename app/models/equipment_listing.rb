class EquipmentListing < ApplicationRecord
  belongs_to :user
  belongs_to :item_type
  belongs_to :condition

  has_many_attached :photos
  
  validates :photos, limit: { min: 0, max: 5, message: 'Max file limit reached. 5 Files max' }, 
                     content_type: [:png, :jpg, :jpeg]

  validates :description, presence: true 
  validates_length_of :description, maximum: 500

  validates :title, presence: true
  validates_length_of :title, maximum: 60

  validates :address, presence: true

  validates :price, presence: true

end
