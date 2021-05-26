class User < ApplicationRecord
  rolify
  has_many :equipment_listings, dependent: :destroy
  has_many :services, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :phone, length: { maximum: 12 }

  acts_as_messageable

  before_destroy { messages.destroy_all }

  # Creates a default role when a user signs up
  after_create :default_role

  def default_role
    add_role(:member)
  end
end
