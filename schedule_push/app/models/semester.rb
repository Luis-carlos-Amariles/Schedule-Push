class Semester < ActiveRecord::Base
	# ---------------------- relations -------------------- #
	has_many :matters
	has_many :users

	# --------------------- validations ------------------- #
	validates :number, presence:{message:'no entered.'}, uniqueness:{message:'already exists!'}
	validates :level, presence:{message:'no entered.'}

	# ------------------------ scopes --------------------- #

	# ----------------------- methods --------------------- #
	include PermissionsConcern
end
