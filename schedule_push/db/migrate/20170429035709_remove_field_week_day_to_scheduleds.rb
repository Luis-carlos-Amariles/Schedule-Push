class RemoveFieldWeekDayToScheduleds < ActiveRecord::Migration
  def change
    remove_column :scheduleds, :week_day, :string
    add_column :users_by_scheduleds, :week_day, :string
  end
end
