class Test < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :category

  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.with_category(category_name)
    joins('JOIN categories ON tests.category_id == categories.id')
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
