class Badge < ApplicationRecord
  enum rule_type: { on_first_try: 0, all_categories: 1 }

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :url, :rule_type, :rule_value, presence: true
  validates :name, uniqueness: true

  def self.rules
    [
      ["Тест пройден с первой попытки", Badge.rule_types[:on_first_try]],
      ["Пройдены все тесты категории", Badge.rule_types[:all_categories]]
    ]
  end
end
