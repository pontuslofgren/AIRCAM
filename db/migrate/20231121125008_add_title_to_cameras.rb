class AddTitleToCameras < ActiveRecord::Migration[7.1]
  def change
    add_column :cameras, :title, :string
  end
end
