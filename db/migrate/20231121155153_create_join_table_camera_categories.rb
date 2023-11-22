class CreateJoinTableCameraCategories < ActiveRecord::Migration[7.1]
  def change
    create_join_table :cameras, :categories do |t|
      t.index [:camera_id, :category_id]
      t.index [:category_id, :camera_id]
    end
  end
end
