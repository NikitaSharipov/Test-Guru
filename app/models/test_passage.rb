class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_next_question
#  scope :by_category, -> (category, user) { joins(:test).where(tests: {category: category}).where(user: user) }
#  scope :by_level, -> (level, user) { joins(:test).where(tests: {level: level}).where(user: user) }

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)
    save!
  end

  def success?
    correct_answers_percent > 85
  end

  def correct_answers_percent
    correct_question.to_f/test.questions.count*100
  end

  def questions_count
    test.questions.count
  end

  def question_number
    questions_count - further_questions.size
  end

  def timer?
    self.test.timer?
  end

  def time_over?
    timer? && Time.current > end_time
  end

  def time_left
    end_time - Time.current
  end

  private

  def before_validation_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    if answer_ids.nil?
      correct_answers.ids.count == 0
    else
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first if test.present?
    else
      further_questions.first
    end
  end

  def further_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def end_time
    @end_time ||= self.created_at + test.passage_time.minutes
  end
end
