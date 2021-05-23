class Test < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :category

  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy
  has_many :questions

  scope :easy_level, -> { where(level: (0..1)) }
  scope :medium_level, -> { where(level: (2..4)) }
  scope :hard_level, -> { where(level: (5..Float::INFINITY)) }

  scope :with_category, ->(category_name) {
    joins(:category)
      .where(categories: { title: category_name })
      .pluck(:title)
  }

end
