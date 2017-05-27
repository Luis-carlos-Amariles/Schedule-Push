class App < ActiveRecord::Base
	# ---------------------- relations -------------------- #
	has_many :devices

	# --------------------- validations ------------------- #
	validates :name, presence:{message:'no entered.'}
	validates :api_key, presence:{message:'no entered.'}, length:{minimum:60, message:'minimum should to be of sixty characters.'}, uniqueness:{message:'already exists!'}
	validates :client_key, presence:{message:'no entered.'}, uniqueness:{message:'already exists!'}

	# ------------------------ scopes --------------------- #

	# ----------------------- methods --------------------- #
	include PermissionsConcern
end
