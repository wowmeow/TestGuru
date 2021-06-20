class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show
    set_test
  end

  def start
    set_test
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :category_id, :author_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
