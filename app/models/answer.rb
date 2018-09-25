class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true

  scope  :correct_answer, -> { where(correct: true) }

  validate :validate_amount_answers, on: :create

  def validate_amount_answers
    return if question.answers.length.between?(1,4)
    errors.add(:answers, 'Amount of answers to question sholud be from 1 to 4')
  end

end

