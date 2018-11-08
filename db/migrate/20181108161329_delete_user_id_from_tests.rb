class DeleteUserIdFromTests < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :user_id
  end
end
