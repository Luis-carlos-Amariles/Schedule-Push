class Room < ActiveRecord::Base
	# ---------------------- relations -------------------- #
	has_many :teacher_by_matters

	# --------------------- validations ------------------- #
	validates :code, presence:{message:'no entered.'}, uniqueness:{message:'already exists!'}
	validates :name, presence:{message:'no entered.'}
	validates :floor, presence:{message:'no entered.'}

	before_validation :save_valid_name
	# ------------------------ scopes --------------------- #

	# ----------------------- methods --------------------- #
	include PermissionsConcern

end
