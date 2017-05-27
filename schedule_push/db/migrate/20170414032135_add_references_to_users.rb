class AddReferencesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :rol, index: true, foreign_key: true
    add_reference :users, :device, index: true, foreign_key: true
  end
end
