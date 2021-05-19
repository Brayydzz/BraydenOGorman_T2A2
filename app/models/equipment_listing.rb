class EquipmentListing < ApplicationRecord
  belongs_to :user
  belongs_to :item_type
  belongs_to :condition

  has_many_attached :photos

  private 

  validates :photos, limit: { min: 0, max: 3, message: 'Max file limit reached. 3 Files max' }



  # Validation for maximum photo upload
  # def validate_photos
  #    self.errors.add(:photos, "Maximum upload limit") if photos.count <= 4
  # end 
end
