class NotificationsController < ApplicationController
  before_action :set_notification, only: [:edit, :update, :destroy]
  before_action :set_devices, only: [:new, :edit, :create, :update]

  # GET /notifications
  def index
    @notifications = Notification.all
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to notifications_path, notice: 'Notification was successfully created.' }
        format.json { render :index, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to notifications_path, notice: 'Notification was successfully updated.' }
        format.json { render :index, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # use for get all devices
    def set_devices
      @devices = Device.order(:token)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:message, :title, :badge, :send, :device_id)
    end
end
