class ServicesController < ApplicationController
  before_action :set_service, only: [:destroy]

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    @service.babysitter = Babysitter.find(params[:babysitter_id])
    @service.total_price = @service.babysitter.price * service_params[:duration].to_i
    @service.save
    redirect_to services_path
    authorize @service
  end

  def index
    @services = policy_scope(Service).where(user: current_user).order(date_time: :asc)
  end

  def index_babysitter
  end

  def destroy
    @service.destroy
    redirect_to babysitter_path(@service.babysitter)
  end

  private

  def service_params
    params.require(:service).permit(:date_time, :duration)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
