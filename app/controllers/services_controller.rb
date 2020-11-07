class ServicesController < ApplicationController
  before_action :set_service, only: [:destroy]

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    @babysitter = Babysitter.find(params[:babysitter_id])
    @service.babysitter = @babysitter
    @service.total_price = @service.babysitter.price * service_params[:duration].to_i
    if @service.save
      redirect_to services_path
    else
      @service = Service.new
      render "babysitters/show"
    end
    authorize @service
  end

  def index
    @services = policy_scope(Service).where(user: current_user).order(start_date: :asc)
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
