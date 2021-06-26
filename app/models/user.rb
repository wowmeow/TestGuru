class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :all_tests_with_level, lambda { |level|
    Test.joins(:test_passages)
        .where(results: { user_id: id })
        .where(tests: { level: level })
  }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
