class ServicesController < ApplicationController
  before_action :set_service, only: [:destroy]

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    @service.babysitter = Babysitter.find(params[:babysitter_id])
    @user = current_user
    redirect_to services_path
    authorize @service
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
