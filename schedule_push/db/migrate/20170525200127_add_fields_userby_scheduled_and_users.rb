class AddFieldsUserbyScheduledAndUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :semester, index: true, foreign_key: true
  	remove_column :users_by_scheduleds, :week_day, :string
  end
end
