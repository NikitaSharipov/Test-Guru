class CreateBadgeReceptions < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_receptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
