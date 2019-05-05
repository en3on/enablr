class AddPerkRefToProjectEnablrs < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_enablrs, :perk, foreign_key: true
  end
end
