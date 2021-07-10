class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_name, null: false
      t.string :receiving_condition, null: false

      t.timestamps
    end
  end
end
