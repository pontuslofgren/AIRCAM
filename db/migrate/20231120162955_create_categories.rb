class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.references :camera, null: false, foreign_key: true

      t.timestamps
    end
  end
end
