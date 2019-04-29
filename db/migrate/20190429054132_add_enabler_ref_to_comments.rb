class AddEnablerRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :enabler, foreign_key: true
  end
end
