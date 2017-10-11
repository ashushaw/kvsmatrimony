class AddColoumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :language, :string
    add_column :users, :education, :string
    add_column :users, :occupation, :string
  end
end
