class AddDateAndReflectionToMission < ActiveRecord::Migration[5.1]
  def change
    add_column :missions, :finishdate, :date
    add_column :missions, :reflection, :text
  end
end
