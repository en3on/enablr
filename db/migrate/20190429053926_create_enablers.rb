class CreateEnablers < ActiveRecord::Migration[5.2]
  def change
    create_table :enablers do |t|
      t.float :pledged_amount


      t.timestamps
    end
  end
end
