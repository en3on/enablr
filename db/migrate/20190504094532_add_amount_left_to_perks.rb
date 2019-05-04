class AddAmountLeftToPerks < ActiveRecord::Migration[5.2]
  def change
    add_column :perks, :amount_left, :integer
  end
end
