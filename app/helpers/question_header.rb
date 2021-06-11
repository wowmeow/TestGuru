module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Создать новый вопрос в тесте '#{question.test.title}'"
    else
      "Редактировать вопрос в тесте '#{question.test.title}'"
    end
  end
end
