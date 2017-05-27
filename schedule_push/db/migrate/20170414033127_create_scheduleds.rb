class CreateScheduleds < ActiveRecord::Migration
  def change
    create_table :scheduleds do |t|
      t.integer :block
      t.integer :start_hour
      t.string :week_day

      t.timestamps null: false
    end
  end
end
