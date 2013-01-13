class CreateSectionUsersTable < ActiveRecord::Migration
  def change
  
    create_table :section_users do |t|
      t.integer :section_id
      t.integer :user_id
      t.integer :task
      
      t.timestamps
    end
  end
end
