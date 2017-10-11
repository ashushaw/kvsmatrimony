class AddHeightToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :height_feet, :integer
    add_column :users, :height_inch, :integer
  end
end
