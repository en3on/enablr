class AddPerkRefToEnablers < ActiveRecord::Migration[5.2]
  def change
    add_reference :enablers, :perk, foreign_key: true
  end
end
