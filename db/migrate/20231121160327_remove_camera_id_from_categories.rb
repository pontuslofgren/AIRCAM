class RemoveCameraIdFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :camera_id, :integer
  end
end
