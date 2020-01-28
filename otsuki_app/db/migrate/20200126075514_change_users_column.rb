class ChangeUsersColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :age, :integer
    add_column :users, :position, :string
    add_column :users, :family, :string
    add_column :users, :team, :string
  end
end
