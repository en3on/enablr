class CreateProjectEnablrs < ActiveRecord::Migration[5.2]
  def change
    create_table :project_enablrs do |t|
      t.float :pledged_amount

      t.timestamps
    end
  end
end
