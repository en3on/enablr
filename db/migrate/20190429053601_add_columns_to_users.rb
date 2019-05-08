class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :fundraiser, :boolean, null: false
    add_column :users, :country, :string, null: false
    add_column :users, :city, :string, null: false
  end
end
