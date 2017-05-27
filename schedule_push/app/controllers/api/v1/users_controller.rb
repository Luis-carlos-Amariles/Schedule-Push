class Api::V1::UsersController < ApplicationController
	skip_before_filter :authenticate_user!

  # use for login fo mobile
  def sign_in_user
  	result = {success: false, status_code: 403, message:"Unprocessable Entity"}

  	unless params[:email].blank? && params[:password].blank?
  		user = User.find_for_authentication(email: params[:email])

  		if user && user.active == true
  			if user.valid_password?(params[:password])
  				result = {
            success: true,
            status_code: 200,
            user_name: user.name_with_surname,
            user_email: user.email,
            token: user.token_pass,
            code: user.rol.code
          }
  			end
      else
        result[:status_code] = 401
        result[:message] = 'Unauthorized, The user is inactive.'
  		end
  	end

  	render json: result.to_json(except:[:created_at, :updated_at, :active])
  end

  # use for return matters
  def get_matters
    result = {success: false, status_code: 403, message: "Unprocessable Entity"}

    unless params[:token].blank? && params[:email].blank?
      user = User.find_by(email: params[:email], token_pass: params[:token])
      if user
        scheduled = []
        user.semester.matters.each do |matter|
          scheduled.push({matter_name: matter.name,
                          teacher_name: matter.teacher_by_matter.user.name_with_surname,
                          room_name: "#{matter.teacher_by_matter.room.name} - #{matter.teacher_by_matter.room.code}",
                          class_hour: Scheduled.where(teacher_by_matter_id: matter.teacher_by_matter.id).first.block_with_hour})
        end

        result = {
          scheduled: scheduled,
          status_code: 200,
          message: "request successfully",
          success: true
        } 
      end
    end

    render json: result.to_json(except: [:created_at, :updated_at])
  end
end
