class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :token
      t.string :installation_id
      t.references :app, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :devices, :token, unique: true
  end
end
