class CreatePrompts < ActiveRecord::Migration[7.1]
  def change
    create_table :prompts do |t|
      t.string :prompt
      t.string :tag
      t.string :username
      t.string :image

      t.timestamps
    end
  end
end
