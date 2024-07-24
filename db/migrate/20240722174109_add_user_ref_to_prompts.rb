class AddUserRefToPrompts < ActiveRecord::Migration[7.1]
  def change
    add_reference :prompts, :user, null: false, foreign_key: true
  end
end
