class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.boolean :hardware
      t.integer :current_amount
      t.integer :target_amount
      t.string :target_date
      t.string :category
      t.string :country
      t.string :city
      t.integer :backer_amount

      t.timestamps
    end
  end
end
