class WeeksController < ApplicationController
  before_action :set_week, only: [:edit, :update, :destroy]

  # GET /weeks
  def index
    @weeks = Week.all
  end

  # GET /weeks/new
  def new
    @week = Week.new
    @week_days = @week.week_days
  end

  # GET /weeks/1/edit
  def edit
    @week_days = @week.week_days
  end

  # POST /weeks
  def create
    @week = Week.new(week_params)

    respond_to do |format|
      if @week.save
        format.html { redirect_to weeks_path, notice: 'Week was successfully created.' }
        format.json { render :index, status: :created, location: @week }
      else
        @week_days = @week.week_days
        format.html { render :new }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weeks/1
  def update
    respond_to do |format|
      if @week.update(week_params)
        format.html { redirect_to weeks_path, notice: 'Week was successfully updated.' }
        format.json { render :index, status: :ok, location: @week }
      else
        @week_days = @week.week_days
        format.html { render :edit }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weeks/1
  def destroy
    @week.destroy
    respond_to do |format|
      format.html { redirect_to weeks_url, notice: 'Week was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week
      @week = Week.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_params
      params.require(:week).permit(:week_day, :number_day)
    end
end
