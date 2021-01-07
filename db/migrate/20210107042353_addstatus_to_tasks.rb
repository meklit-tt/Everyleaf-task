class AddstatusToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :string, default: 'unstarted' , "in progress", "completed"
  end
end
