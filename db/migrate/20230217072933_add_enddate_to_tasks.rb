class AddEnddateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :enddate, :date
  end
end
