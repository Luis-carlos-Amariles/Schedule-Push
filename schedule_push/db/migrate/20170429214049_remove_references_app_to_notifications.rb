class RemoveReferencesAppToNotifications < ActiveRecord::Migration
  def change
  	add_reference :notifications, :device, index: true, foreign_key: true
    remove_reference :notifications, :app, index: true, foreign_key: true
  end
end
