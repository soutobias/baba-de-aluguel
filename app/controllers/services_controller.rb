class ServicesController < ApplicationController
  before_action :set_service, only: [:destroy]

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    @service.babysitter = Babysitter.find(params[:babysitter_id])
    @service.save
    render :index_user
    authorize @service
  end

  def index
    @services = policy_scope(Service).where(user: :current_user)
  end

  def index_babysitter
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
