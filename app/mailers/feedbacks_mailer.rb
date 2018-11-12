class FeedbacksMailer < ApplicationMailer

  def send_feedback(title, body, user_email)
    @feedback_title = title
    @feedback_body = body
    @feedback_email = user_email

    mail to: 'sharipovkzn@mail.ru'
  end

end
