class EquipmentListing < ApplicationRecord
  belongs_to :user
  belongs_to :item_type
  belongs_to :condition
  validate :validate_photos

  has_many_attached :photos

  private 


  # Validation for maximum photo upload
  def validate_photos
     self.errors.add(:photos, "Maximum upload limit")if photos.count <= 4
  end 
end
