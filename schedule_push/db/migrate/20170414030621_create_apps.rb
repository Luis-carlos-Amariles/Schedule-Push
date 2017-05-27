class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :client_key
      t.string :api_key

      t.timestamps null: false
    end

    add_index :apps, :client_key, unique: true
    add_index :apps, :api_key, unique: true
  end
end
