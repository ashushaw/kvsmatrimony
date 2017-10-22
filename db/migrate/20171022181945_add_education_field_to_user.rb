class AddEducationFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :college_attended, :string
    add_column :users, :annual_income, :string
    add_column :users, :education_field, :string
  end
end
