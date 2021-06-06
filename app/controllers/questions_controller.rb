class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  def index
    render plain: @test.questions.pluck(:text)
  end

  def create
    @question = @test.questions.new(test_params)
    if @question.save
      redirect_to question
    else
      render :new
    end
  end

  def new; end

  def edit; end

  def show
    render plain: @question.title
  end

  def update; end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def test_params
    params.require(:question).permit(:text)
  end
end
