class AddMaxStudentsAndMaxVolunteersToEvent < ActiveRecord::Migration
  def change
    add_column :events, :max_students,   :integer, :null => false, :default => 0
    add_column :events, :max_volunteers, :integer, :null => false, :default => 0
  end
end
