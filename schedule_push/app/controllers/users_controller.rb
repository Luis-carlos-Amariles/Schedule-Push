class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :destroy]
  before_action :get_roles, only: [:new, :edit, :create, :update]
  before_action :get_semesters, only: [:new, :edit, :create, :update]

  def home
  end

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(set_params)
    @user.token_pass = generate_password
    @user.password = "12345678"
    # @user.token_pass

    respond_to do |format|
      if @user.save
        format.html{redirect_to users_path, notice:'User was created successfully'}
        format.json{render :index, status: :created, location: @user}
      else
        format.html{render :new}
        format.json{render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(set_params)
        format.html{redirect_to users_path, notice: 'User was updated successfully.'}
        format.json{render :index, status: :ok, location: @user}
      else 
        format.html{render :edit}
        format.json{render json: @user.errors, status: :unprocessable_entity}       
      end
    end
  end

  def destroy
    if @user.device
      message = "User can't to be deleted because he has an assigned device."
    else
      @user.destroy
      message = "User was delete successfully."
    end

    respond_to do |format|
      format.html{redirect_to users_path, notice: message}
      format.json{head :no_content}
    end
  end

  private

  # use for return all roles
  def get_roles
    @roles = Rol.order(:name)
  end

  # use for return all roles
  def get_semesters
    @semesters = Semester.order(:number)
  end

  # use for create password dinamic
  def generate_password
    password = loop do
      token = SecureRandom.base64(12)
      break token unless User.exists?(token_pass: token)
    end
  end

  # use callback for 
  def set_user
  	@user = User.find(params[:id])
  end

  #  use for security of params in browser
  def set_params
  	params.require(:user).permit(:name, :surname, :email, :phone, :active, :document, :token_pass, :rol_id, :device_id, :semester_id)
  end
end
