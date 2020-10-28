class ServicesController < ApplicationController
  before_action :set_service, only: [:destroy]

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    @service.babysitter = Babysitter.find(params[:babysitter_id])
    redirect_to service_path(@service)
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
