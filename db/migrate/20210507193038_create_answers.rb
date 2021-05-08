class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.boolean :correct, null: false, default: false
      t.references :question, null: false

      t.timestamps
    end
  end
end
