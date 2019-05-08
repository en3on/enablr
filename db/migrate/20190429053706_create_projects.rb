class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.boolean :hardware, null: false
      t.integer :current_amount, null: false
      t.integer :target_amount, null: false
      t.timestamp :target_date, null: false
      t.string :category, null: false
      t.string :country, null: false
      t.string :city, null: false
      t.integer :backer_amount, null: false

      t.timestamps
    end
  end
end
