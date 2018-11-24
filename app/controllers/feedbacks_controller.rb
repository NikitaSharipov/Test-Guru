class FeedbacksController < ApplicationController

  def index
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.email = current_user.email
    if @feedback.valid?
      FeedbacksMailer.send_feedback(@feedback.title, @feedback.body, @feedback.email ).deliver_now
      redirect_to tests_path, notice: t('.success')
    else
      render :new
    end
  end

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end

end
