class CreateInvolvedTests < ActiveRecord::Migration[5.2]
  def change
    create_table :involved_tests do |t|
      t.belongs_to :users, foreign_key: true
      t.belongs_to :tests, foreign_key: true

      t.timestamps
    end
  end
end
