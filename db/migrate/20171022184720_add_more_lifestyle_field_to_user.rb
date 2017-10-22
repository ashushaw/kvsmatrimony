class AddMoreLifestyleFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rashi, :string
    add_column :users, :marital_status, :string
  end
end
