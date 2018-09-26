class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_amount_answers, on: :create

  scope  :right, -> { where(correct: true) }

  def validate_amount_answers
    return if question.answers.length < 4
    errors.add(:answers, 'Amount of answers to question sholud be from 1 to 4')
  end

end
