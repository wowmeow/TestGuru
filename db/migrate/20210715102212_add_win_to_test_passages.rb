class AddWinToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :win, :boolean
  end
end
