class RemoveReferencesScheduledToTeacherByMatter < ActiveRecord::Migration
  def change
  	add_reference :scheduleds, :teacher_by_matter, index: true, foreign_key: true
  	remove_reference :teacher_by_matters, :scheduled, index: true, foreign_key: true
  end
end
