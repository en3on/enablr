class CreatePerks < ActiveRecord::Migration[5.2]
  def change
    create_table :perks do |t|
      t.integer :minimum_amount
      t.boolean :unlimited
      t.integer :enablr_amount

      t.timestamps
    end
  end
  end
