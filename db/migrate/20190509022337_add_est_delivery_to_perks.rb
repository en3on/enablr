class AddEstDeliveryToPerks < ActiveRecord::Migration[5.2]
  def change
    add_column :perks, :estimated_delivery, :datetime
  end
end
