class AddMajorHighschoolNicknameYearsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :highschool, :string
    add_column :users, :year, :string
    add_column :users, :nickname, :string
    add_column :users, :major, :string
  end
end
