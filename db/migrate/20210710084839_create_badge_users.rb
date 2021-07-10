class CreateBadgeUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_users do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :number_of_badges, default: 1

      t.timestamps
    end
  end
end
