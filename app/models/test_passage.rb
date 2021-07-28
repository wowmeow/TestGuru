class TestPassage < ApplicationRecord
  SUCCESSFUL_RESULT = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def completed?
    current_question.nil? && time_over?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  def time_over?
    created_at + test.timer.minutes > Time.current
  end

  def progress_bar_string
    question_number.to_s + ' / ' + self.test.questions.count.to_s
  end

  def seconds_left
    past_seconds = (Time.now - self.created_at).to_i
    timer_seconds = self.test.timer * 60

    timer_seconds - past_seconds
  end

  def time_over?
    self.test.timer ? seconds_left <= 0 : false
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def current_result
    correct_questions.to_i / test.questions.count
  end

  def successful_result?
    current_result >= SUCCESSFUL_RESULT
  end

  private

  def before_validation_set_current_question
    self.current_question =
      if new_record?
        test.questions.first if test.present?
      else
        next_question
      end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort unless answer_ids.nil?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
