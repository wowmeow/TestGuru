class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :url, :rule_type, :rule_value, presence: true
  validates :name, uniqueness: true
end
