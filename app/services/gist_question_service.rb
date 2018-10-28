class GistQuestionService

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  class ResultObject

    attr_reader :response
    delegate :html_url, to: :response

    def initialize(response)
      @response = response

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

  def default_client
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
    content = [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

end
