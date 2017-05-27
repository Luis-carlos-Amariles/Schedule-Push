class Matter < ActiveRecord::Base
  # ---------------------- relations -------------------- #
  belongs_to :semester
  has_many :teacher_by_matters

  # --------------------- validations ------------------- #
  validates :code, presence:{message:'no entered.'}, length:{minimum: 6, message:'minimum six numbers.'}, uniqueness:{message:'already exists in this semester!', scope: :semester_id}
  validates :name, presence:{message:'no entered.'}, uniqueness:{message:'already exists with this semester!', scope: :semester_id}
  validates :semester_id, presence:{message:'no entered.'}

  before_validation :save_valid_name

  # ------------------------ scopes --------------------- #

  # ----------------------- methods --------------------- #
  include PermissionsConcern
end
