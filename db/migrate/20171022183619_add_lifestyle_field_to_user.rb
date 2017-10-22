class AddLifestyleFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :diet, :string
    add_column :users, :body_type, :string
    add_column :users, :skin_tone, :string
  end
end
