class GistQuestionService
  ResultObject = Struct.new(:success?, :html_url)

  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: ENV.fetch(:GITHUB_ACCESS_TOKEN))
  end

  def call
    response = @client.create_gist(gist_params)
    ResultObject.new(response.html_url.present?, response.html_url)
  end

  private

  def gist_params
    {
      description: "Вопрос из теста '#{@test.title}' из TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.text, *@question.answers.pluck(:title)].join("\n")
  end
end
