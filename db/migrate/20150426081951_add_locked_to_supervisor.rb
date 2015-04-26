class AddLockedToSupervisor < ActiveRecord::Migration
  def change
    add_column :supervisors, :locked, :boolean
  end
end
