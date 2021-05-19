class EquipmentListing < ApplicationRecord
  belongs_to :user
  belongs_to :item_type
  belongs_to :condition

  has_many_attached :photos
  
  validates :photos, limit: { min: 0, max: 3, message: 'Max file limit reached. 3 Files max' }, 
                     content_type: [:png, :jpg, :jpeg]
  # validates :item_type, presence: true 
  validates :description, presence: true 
  validates :title, presence: true
  # validates :condition, presence: true

end
