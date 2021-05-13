class User < ApplicationRecord
  has_many :tests
  has_many :results, dependent: :destroy

  def current_tests_by(level)
    tests.where(level: level)
  end
end
