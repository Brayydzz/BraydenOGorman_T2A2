class Service < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates_length_of :title, maximum: 60
  
  validates :location, presence: true
  
  validates :description, presence: true
  validates_length_of :description, maximum: 500

  validates :price, presence: true

  validates :photo, content_type: [:png, :jpg, :jpeg]

  has_one_attached :photo
  
end
