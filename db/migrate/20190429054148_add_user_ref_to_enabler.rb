class AddUserRefToEnabler < ActiveRecord::Migration[5.2]
  def change
    add_reference :enablers, :user, foreign_key: true
  end
end
