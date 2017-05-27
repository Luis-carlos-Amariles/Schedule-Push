class Scheduled < ActiveRecord::Base
	# ---------------------- relations -------------------- #
	belongs_to :teacher_by_matter
	belongs_to :week

	# --------------------- validations ------------------- #
	validates :block, presence:{message:'no entered.'}, numericality:{only_integer: true, message:'should to be number.'}
	validates :start_hour, presence:{message:'no entered.'}, numericality:{only_integer: true, message:'should to be number.'}
	validates :teacher_by_matter, presence:{message:'no entered.'}
	validates :week_id, presence:{message:'no entered.'}

	# ------------------------ scopes --------------------- #

	# ----------------------- methods --------------------- #
	include PermissionsConcern
end
