class User < ApplicationRecord
  has_many :tests, dependent: :nullify
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy

  def all_tests_with(level)
    Test.joins('JOIN results ON tests.id == results.test_id')
        .where(results: { user_id: id })
        .where(tests: { level: level })
  end
end
