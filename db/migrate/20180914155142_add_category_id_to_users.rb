class AddCategoryIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :category_id, :int
  end
end
