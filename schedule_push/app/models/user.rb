class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# ---------------------- relations -------------------- #
	belongs_to :rol
	belongs_to :device
	belongs_to :semester
	has_many :teacher_by_matters

	# --------------------- validations ------------------- #
	validates :name, presence:{message:'no entered.'}
	validates :surname, presence:{message:'no entered.'}
	validates :email, presence:{message:'no entered.'}, uniqueness:{message:'already exists!'}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'incorrect format.'}
	validates :phone, presence:{message:'no entered.'}
	validates :document, presence:{message:'no entered.'}, uniqueness:{message:'already exists!'}
	validates :semester_id, presence:{messag:'no entered'}
	validates :rol_id, presence:{message:'no entered.'}

	before_validation :save_valid_name_with_surname

	# ------------------------ scopes --------------------- #
	scope :users_actives,->{where(active: true)}
	scope :get_teachers,->{joins(:rol).where("rols.code = ?", "#{302}").order(:name)}
	scope :get_students,->{joins(:rol).where("rols.code = ?", "#{301}").order(:name)}

	# ----------------------- methods --------------------- #
	include PermissionsConcern

end
