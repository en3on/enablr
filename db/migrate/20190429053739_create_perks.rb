class CreatePerks < ActiveRecord::Migration[5.2]
  def change
    create_table :perks do |t|
      t.integer :minimum_amount, null: false
      t.boolean :unlimited, null: false
      t.integer :enablr_amount, null: false

      t.timestamps
    end
  end
  end
