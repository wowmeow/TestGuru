class RemoveLoginFromUsers < ActiveRecord::Migration[6.1]
  remove_column :users, :login
end
