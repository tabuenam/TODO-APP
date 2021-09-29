class RemoveCategoryFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :category, :string
  end
end
