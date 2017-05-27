class TeacherByMattersController < ApplicationController
  before_action :set_teacher_by_matter, only: [:show, :edit, :update, :destroy]
  before_action :set_resources, only: [:new, :edit, :update, :create]

  # GET /teacher_by_matters
  def index
    @teacher_by_matters = TeacherByMatter.all
  end

  # GET /teacher_by_matters/new
  def new
    @teacher_by_matter = TeacherByMatter.new
  end

  # GET /teacher_by_matters/1/edit
  def edit
  end

  # POST /teacher_by_matters
  def create
    @teacher_by_matter = TeacherByMatter.new(teacher_by_matter_params)

    respond_to do |format|
      if @teacher_by_matter.save
        format.html { redirect_to teacher_by_matters_path, notice: 'Teacher by matter was successfully created.' }
        format.json { render :index, status: :created, location: @teacher_by_matter }
      else
        format.html { render :new }
        format.json { render json: @teacher_by_matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teacher_by_matters/1
  def update
    respond_to do |format|
      if @teacher_by_matter.update(teacher_by_matter_params)
        format.html { redirect_to teacher_by_matters_path, notice: 'Teacher by matter was successfully updated.' }
        format.json { render :index, status: :ok, location: @teacher_by_matter }
      else
        format.html { render :edit }
        format.json { render json: @teacher_by_matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_by_matters/1
  def destroy
    @teacher_by_matter.destroy
    respond_to do |format|
      format.html { redirect_to teacher_by_matters_url, notice: 'Teacher by matter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_by_matter
      @teacher_by_matter = TeacherByMatter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_by_matter_params
      params.require(:teacher_by_matter).permit(:matter_id, :room_id, :user_id)
    end

    def set_resources
      @matters = Matter.order(:name)
      @rooms = Room.order(:code)
      @users = User.users_actives.get_teachers
    end
end
