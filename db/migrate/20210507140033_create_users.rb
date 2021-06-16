class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: 'guest'
      t.string :role, null: false, default: 'user'
      t.string :login, null: false
      t.string :password, null: false

      t.timestamps

      t.index :login, unique: true
    end
  end
end
