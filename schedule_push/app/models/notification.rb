class Notification < ActiveRecord::Base
  # ---------------------- relations -------------------- #
  belongs_to :device

  # --------------------- validations ------------------- #
  validates :message, presence:{message:'no entered.'}, length:{maximum: 160, message:'maximum 160 characters.'}
  validates :title, presence:{message:'no entered'}, length:{maximum: 40, message:'maximum 40 characters.' }

  # ------------------------ scopes --------------------- #

  # ----------------------- methods --------------------- #
  include PermissionsConcern
end
