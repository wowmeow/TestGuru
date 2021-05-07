class CreateAnsvers < ActiveRecord::Migration[6.1]
  def change
    create_table :ansvers do |t|
      t.string :text

      t.timestamps
    end
  end
end
