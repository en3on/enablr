class ProjectEnablrsChangePledgedAmountType < ActiveRecord::Migration[5.2]
  def change
    change_table :project_enablrs do |t|
      t.change :pledged_amount, :integer
    end
  end
end
