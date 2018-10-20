class Admin::QuestionsController < ApplicationController

  before_action :set_test, only: %i[index new create]
  before_action :set_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def show
  end

  def new
    @question = Question.new(test: @test)
  end

  def edit
    set_question
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def update
    set_question

    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy!
    redirect_to admin_test_questions_path(@question.test_id)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Record was not found'
  end

end
