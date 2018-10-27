class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || client_new
  end

  class ResultObject
    attr_reader :response
    attr_accessor :id

    delegate :html_url, to: :response

    def initialize(response)
      @response = response
      @id = response.id
    end

    def success?
      html_url.present?
    end
  end

  def call
    response = @client.create_gist(gist_params)
    ResultObject.new(response)
  end


  private

  def client_new
    Octokit::Client.new(access_token: ENV['SECRET_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description',
                          title: @test.title),
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
