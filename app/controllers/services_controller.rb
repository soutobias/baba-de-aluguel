class ServicesController < ApplicationController
  before_action :set_service, only: [:destroy]

  def new
    @service = Service.new
  end

  def create
    @babysitter = Babysitter.find(params[:babysitter_id])
    @user = current_user
    @service = Service.new(service_params)
    @service.user = @user
    @service.babysitter = @babysitter
    redirect_to service_path(@service)
  end

  def destroy
    @service.destroy
    redirect_to babysitter_path(@service.babysitter)
  end

  private

  def service_params
    params.require(:service).permit(:start_date, :end_date, :duration)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
