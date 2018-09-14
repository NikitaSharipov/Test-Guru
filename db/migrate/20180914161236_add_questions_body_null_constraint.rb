class AddQuestionsBodyNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:quiestions, :body, false)
  end
end
