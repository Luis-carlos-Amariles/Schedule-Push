class MattersController < ApplicationController
  before_action :set_matter, only: [:edit, :update, :destroy]
  before_action :get_semesters, only: [:new, :edit, :create, :update]

  # GET /matters
  def index
    @matters = Matter.order(:name)
  end

  # GET /matters/new
  def new
    @matter = Matter.new
  end

  # GET /matters/1/edit
  def edit
  end

  # POST /matters
  def create
    @matter = Matter.new(matter_params)

    respond_to do |format|
      if @matter.save
        format.html { redirect_to matters_path, notice: 'Matter was successfully created.' }
        format.json { render :index, status: :created, location: @matter }
      else
        format.html { render :new }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matters/1
  def update
    respond_to do |format|
      if @matter.update(matter_params)
        format.html { redirect_to matters_path, notice: 'Matter was successfully updated.' }
        format.json { render :index, status: :ok, location: @matter }
      else
        format.html { render :edit }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matters/1
  def destroy
    @matter.destroy
    respond_to do |format|
      format.html { redirect_to matters_url, notice: 'Matter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # use for get all semester in CRU matters
    def get_semesters
      @semesters = Semester.order(:number)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_matter
      @matter = Matter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matter_params
      params.require(:matter).permit(:code, :name, :semester_id)
    end
end
