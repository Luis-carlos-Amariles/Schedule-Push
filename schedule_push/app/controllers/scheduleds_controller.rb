class ScheduledsController < ApplicationController
  before_action :set_scheduled, only: [:edit, :update, :destroy]
  before_action :set_resources, only: [:new, :edit, :create, :update]

  # GET /scheduleds
  def index
    @scheduleds = Scheduled.order(:block)
  end

  # GET /scheduleds/new
  def new
    @scheduled = Scheduled.new
    @scheduled_hours = @scheduled.scheduled_hours
  end

  # GET /scheduleds/1/edit
  def edit
    @scheduled_hours = @scheduled.scheduled_hours
  end

  # POST /scheduleds
  def create
    @scheduled = Scheduled.new(scheduled_params)

    respond_to do |format|
      if @scheduled.save
        format.html { redirect_to scheduleds_path, notice: 'Scheduled was successfully created.' }
        format.json { render :index, status: :created, location: @scheduled }
      else
        @scheduled_hours = @scheduled.scheduled_hours
        format.html { render :new }
        format.json { render json: @scheduled.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduleds/1
  def update
    respond_to do |format|
      if @scheduled.update(scheduled_params)
        format.html { redirect_to scheduleds_path, notice: 'Scheduled was successfully updated.' }
        format.json { render :index, status: :ok, location: @scheduled }
      else
        @scheduled_hours = @scheduled.scheduled_hours
        format.html { render :edit }
        format.json { render json: @scheduled.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduleds/1
  def destroy
    @scheduled.destroy
    respond_to do |format|
      format.html { redirect_to scheduleds_url, notice: 'Scheduled was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled
      @scheduled = Scheduled.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduled_params
      params.require(:scheduled).permit(:block, :start_hour, :week_id, :teacher_by_matter_id)
    end

    # use for get teacher by matters to select
    def set_resources
      @teacher_by_matters = TeacherByMatter.all
      @weeks = Week.order(:number_day)
    end
end
