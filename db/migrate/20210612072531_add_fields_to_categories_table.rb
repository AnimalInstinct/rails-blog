class AddFieldsToCategoriesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :parent_id, :string
    add_column :categories, :name, :string
    add_column :categories, :description, :text
  end
end
