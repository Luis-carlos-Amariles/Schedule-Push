class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :message
      t.string :title
      t.integer :badge
      t.boolean :send, default: false
      t.references :app, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
