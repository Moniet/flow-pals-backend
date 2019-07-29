class RemoveUserIdFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :user_id
    add_column :projects, :content, :string
  end
end
