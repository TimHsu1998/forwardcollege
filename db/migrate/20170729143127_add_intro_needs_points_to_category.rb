class AddIntroNeedsPointsToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :intro, :text
    add_column :categories, :needs, :integer
    add_column :categories, :points, :integer
  end
end
