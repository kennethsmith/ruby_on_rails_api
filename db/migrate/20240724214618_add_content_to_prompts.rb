class AddContentToPrompts < ActiveRecord::Migration[7.1]
  def change
    add_column :prompts, :content, :string
  end
end
