class AddDeliverableToPerks < ActiveRecord::Migration[5.2]
  def change
    add_column :perks, :not_deliverable, :boolean
  end
end
