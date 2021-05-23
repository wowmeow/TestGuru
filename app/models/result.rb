class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates :progress, presence: true
end
