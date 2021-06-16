require 'digest/sha1'

class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :name, presence: true

  has_secure_password

  scope :all_tests_with_level, lambda { |level|
    Test.joins(:test_passages)
        .where(results: { user_id: id })
        .where(tests: { level: level })
  }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
