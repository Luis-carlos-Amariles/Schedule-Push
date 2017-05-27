class Device < ActiveRecord::Base
  # ---------------------- relations -------------------- #
  belongs_to :app
  belongs_to :user # the relation with user is one - one
  has_many :notifications

  # --------------------- validations ------------------- #
  validates :token, presence:{message:'no entered.'}, uniqueness:{message:'already exists!'}
  validates :installation_id, presence:{message:'no entered.'}, uniqueness:{message:'already exists!.'}
  validates :app_id, presence:{message:'no entered.'}

  # ------------------------ scopes --------------------- #

  # ----------------------- methods --------------------- #
  include PermissionsConcern
end
