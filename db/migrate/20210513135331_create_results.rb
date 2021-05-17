class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.index [:user_id, :test_id], unique: true

      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
