class FeedbacksMailer < ApplicationMailer

  def send_feedback(title, body, user_email)
    @title = title
    @body = body
    @email = user_email

    mail
  end

end
