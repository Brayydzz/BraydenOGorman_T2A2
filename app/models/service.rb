class Service < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true

  has_one_attached :photo
  
end
