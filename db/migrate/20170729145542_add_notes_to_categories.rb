class AddNotesToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :note, :text
  end
end
