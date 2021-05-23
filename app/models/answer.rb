class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :validate_max_for_question, on: create

  scope :correct_answers, -> { where(correct: true) }

  private

  def validate_max_for_question
    errors.add(self) if question_id.count > 4 || question_id.count < 1
  end
end
