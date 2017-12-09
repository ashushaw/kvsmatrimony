class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :sex
      t.string :age_min
      t.integer :age_max
      t.string :city

      t.timestamps
    end
  end
end
