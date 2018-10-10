module QuestionsHelper
  def question_header(question)
    word = if question.new_record?
             'Create New'
           else
             'Edit'
           end
     content_tag(:h1, "#{word} #{question.test.title.capitalize} Question")
  end
end
