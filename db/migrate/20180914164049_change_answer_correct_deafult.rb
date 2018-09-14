class ChangeAnswerCorrectDeafult < ActiveRecord::Migration[5.2]
  def change
    change_column_default :answers, :correct, true
  end
end
