class AddThingsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :school, :string
    add_column :users, :session, :string
  end
end
