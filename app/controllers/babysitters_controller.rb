class BabysittersController < ApplicationController
  before_action :set_babysitter, only: [:show, :edit, :update, :destroy]

  def new
    @babysitter = Babysitter.new
    authorize @babysitter
  end

  def create
    @babysitter = Babysitter.new(babysitter_params)
    authorize @babysitter
    if @babysitter.save
      redirect_to babysitter_path(@babysitter)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @babysitter.update(babysitter_params)
    redirect_to babysitter_path(@babysitter)
  end

  def destroy
    @babysitter.destroy
    redirect_to profile_path
  end

  private

  def set_babysitter
    @babysitter = Babysitter.find(params[:id])
    authorize @babysitter
  end

  def babysitter_params
    params.require(:babysitter).permit(:experience, :price)
  end
end
