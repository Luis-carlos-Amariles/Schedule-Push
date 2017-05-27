class TeacherByMatter < ActiveRecord::Base
  # ---------------------- relations -------------------- #
  belongs_to :matter
  belongs_to :room
  has_many :scheduleds
  belongs_to :user

  # --------------------- validations ------------------- #
  validates :matter_id, presence:{message:'no entered.'}
  validates :room_id, presence:{message:'no entered.'}
  validates :user_id, presence:{message:'no entered.'}, uniqueness:{message: "this teacher already exist with the same matter, room and scheduled", scope: [:room_id, :matter_id]}

  # ------------------------ scopes --------------------- #

  # ----------------------- methods --------------------- #
  include PermissionsConcern
end
