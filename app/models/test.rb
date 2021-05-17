class Test < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :results
  has_many :users, through: :results

  def self.with_category(category_name)
    joins('JOIN categories ON tests.category_id == categories.id')
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
