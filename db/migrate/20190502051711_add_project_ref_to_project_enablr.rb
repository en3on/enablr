class AddProjectRefToProjectEnablr < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_enablrs, :project, foreign_key: true
  end
end
