class TestsController < ApplicationController
  before_action :find_test, only: %i[index]

  def show
    @test = find_test
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
