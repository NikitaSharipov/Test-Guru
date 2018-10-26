class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || client_new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def client_new
    Octokit::Client.new(access_token: "a21ab1b11f967337fe8bcde63aee70b251677a0b")
  end

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files:  {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
