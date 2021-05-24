class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :validate_max_for_question, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_for_question
    errors.add(:base, :answers) if question.answers.count >= 4
  end
end
