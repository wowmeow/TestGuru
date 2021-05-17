class User < ApplicationRecord
  # belongs_to :category
  # has_many :tests
  # has_many :questions
  # has_many :results
  # has_many :tests, through: :results

  def all_tests_with(level)
    Test.joins('JOIN results ON tests.id == results.test_id')
        .where(results: { user_id: id })
        .where(tests: { level: level })
  end
end
