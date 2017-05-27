class Week < ActiveRecord::Base
	# ---------------------- relations -------------------- #
	has_many :scheduleds

	# --------------------- validations ------------------- #
	validates :week_day, presence:{message:'no entered.'}, uniqueness:{message:'already exists!'}
	validates :number_day, presence:{message:'no entered.'}, numericality:{only_integer: true, message:'should to be number.'}, uniqueness:{message:'already exists!'}

	# ------------------------ scopes --------------------- #

	# ----------------------- methods --------------------- #
	include PermissionsConcern
end
