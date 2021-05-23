class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: :author_id, dependent: :nullify
  has_many :results
  has_many :tests, through: :results, dependent: :destroy

  scope :all_tests_with_level, ->(level) {
    Test.joins(:results)
        .where(results: { user_id: id })
        .where(tests: { level: level })
  }
end
