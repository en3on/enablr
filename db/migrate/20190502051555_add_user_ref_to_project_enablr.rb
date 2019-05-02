class AddUserRefToProjectEnablr < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_enablrs, :user, foreign_key: true
  end
end
