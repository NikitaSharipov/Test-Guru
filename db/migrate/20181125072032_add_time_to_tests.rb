class AddTimeToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :passage_time, :integer
  end
end
