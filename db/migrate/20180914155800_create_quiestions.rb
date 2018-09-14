class CreateQuiestions < ActiveRecord::Migration[5.2]
  def change
    create_table :quiestions do |t|
      t.string :body
      t.integer :test_id

      t.timestamps
    end
  end
end
