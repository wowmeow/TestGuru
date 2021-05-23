class Test < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :category

  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :easy_level, -> { where(level: (0..1)) }
  scope :medium_level, -> { where(level: (2..4)) }
  scope :hard_level, -> { where(level: (5..Float::INFINITY)) }

  scope :with_category, lambda { |category_name|
    joins(:category)
      .where(categories: { title: category_name })
      .pluck(:title)
  }

end
