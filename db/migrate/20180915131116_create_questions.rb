class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :body
      t.belongs_to(:test, foreign_key: true)
      t.timestamps
    end
  end
end
