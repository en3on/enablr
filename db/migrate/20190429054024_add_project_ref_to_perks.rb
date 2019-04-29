class AddProjectRefToPerks < ActiveRecord::Migration[5.2]
  def change
    add_reference :perks, :project, foreign_key: true
  end
end
