class AddProjectEnablrRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :project_enablr, foreign_key: true
  end
end
