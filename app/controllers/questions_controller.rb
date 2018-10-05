class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
#    render plain:  @test.questions.inspect
    find_test
  end

  def show
     find_question
  end

  def new
    @question = Question.new(test: @test)
  end

  def edit
    find_question
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    find_question

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy!
    redirect_to test_questions_path(@question.test_id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Record was not found'
  end

end
