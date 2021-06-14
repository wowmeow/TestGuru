class TestsController < ApplicationController
  before_action :find_test, only: %i[show]
  before_action :set_test, only: %i[show start]
  before_action :set_user, only: :start

  def index
    @tests = Test.all
  end

  def show
    set_test
  end

  def start
    set_test
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    set_test
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :author_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end
end
