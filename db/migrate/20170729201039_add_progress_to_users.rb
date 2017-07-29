class AddProgressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :progress, :float
  end
end
