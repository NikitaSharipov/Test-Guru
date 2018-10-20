class Admin::AnswersController < ApplicationController
  before_action :set_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]
  def show
  end

  def new
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to [:admin, @answer]
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update

    if @answer.update(answer_params)
      redirect_to [:admin, @answer]
    else
      render :edit
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    redirect_to [:admin, @answer.question]
  end

  private

  def set_question
    @question = Question.set(params[:question_id])
  end
    # Use callbacks to share common setup or constraints between actions.
  def set_answer
      @answer = Answer.set(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
      params.require(:answer).permit(:body, :correct)
  end
end
