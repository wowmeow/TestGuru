class QuestionsController < ApplicationController
  before_action :find_test

  def index
    render plain: @test.questions.pluck(:text)
  end

  def create
    question = @test.questions.new(test_params)
    if question.save
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
  end

  private
  def find_test
    @test = Test.find(params[:test_id])
  end

  def test_params
    params.require(:question).permit(:text)
  end
end
