class DropSearchesTable < ActiveRecord::Migration[5.1]
 def up
     drop_table :searches
   end

   def down
     raise ActiveRecord::IrreversibleMigration
   end
end
