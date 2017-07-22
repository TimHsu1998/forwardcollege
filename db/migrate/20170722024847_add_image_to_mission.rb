class AddImageToMission < ActiveRecord::Migration[5.1]
  def change
    add_column :missions, :image, :string
  end
end
