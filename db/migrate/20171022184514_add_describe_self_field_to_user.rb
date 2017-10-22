class AddDescribeSelfFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :describe_yourself, :string
  end
end
