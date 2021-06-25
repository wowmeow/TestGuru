class GistsController < ApplicationController
  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      flash[:notice] = t('.success')
      Gist.create(url: result.html_url, user: current_user, question: @test_passage.current_question)
    else
      flash[:notice] = t('.failure')
    end

    redirect_to @test_passage
  end
end
