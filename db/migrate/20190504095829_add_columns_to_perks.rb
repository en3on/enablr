class AddColumnsToPerks < ActiveRecord::Migration[5.2]
  def change
    add_column :perks, :name, :string
    add_column :perks, :rewards, :string
  end
end
