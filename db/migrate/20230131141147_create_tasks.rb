class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_content
      t.string :deadline
      t.string :status
      t.string :priority


      t.timestamps
    end
  end
end
