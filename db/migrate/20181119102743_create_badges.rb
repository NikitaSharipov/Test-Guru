class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_address, null: false
      t.string :rule
      t.string :rule_value
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
