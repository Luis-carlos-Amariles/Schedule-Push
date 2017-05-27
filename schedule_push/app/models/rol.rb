class Rol < ActiveRecord::Base
	# ---------------------- relations -------------------- #
	has_many :users

	# --------------------- validations ------------------- #
	validates :name, presence:{message:"no entered."}
	validates :code, presence:{message:"no entered."}, uniqueness:{message:"already exists!"}, length:{minimum: 3, message:'minimum three numbers.'}

	before_validation :save_valid_name
	# ------------------------ scopes --------------------- #

	# ----------------------- methods --------------------- #
	include PermissionsConcern
end
