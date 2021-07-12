class Badge < ApplicationRecord
  # has_many :badge_users, dependent: destroy
  has_many :users, through: :badge_users

  validates :name, presence: true, uniqueness: true
  validates :image_name, presence: true, uniqueness: true
  validates :receiving_condition, presence: true
end
