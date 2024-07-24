class RemovePromptFromPrompts < ActiveRecord::Migration[7.1]
  def change
    remove_column :prompts, :prompt, :string
  end
end
